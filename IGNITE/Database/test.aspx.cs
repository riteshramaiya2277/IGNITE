using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IGNITE.Database
{
    public partial class test : Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["IGNITEConnection"].ConnectionString;
        private string selectedTable
        {
            get { return ViewState["SelectedTable"] as string ?? string.Empty; }
            set { ViewState["SelectedTable"] = value; }
        }
        private string primaryKeyColumn = string.Empty;
        private bool isEditMode
        {
            get { return ViewState["IsEditMode"] != null && (bool)ViewState["IsEditMode"]; }
            set { ViewState["IsEditMode"] = value; }
        }
        private int editRecordId
        {
            get { return ViewState["EditRecordId"] != null ? (int)ViewState["EditRecordId"] : 0; }
            set { ViewState["EditRecordId"] = value; }
        }

        // Cache metadata in ViewState to avoid repeated schema queries
        private DataTable CachedTables
        {
            get { return ViewState["CachedTables"] as DataTable; }
            set { ViewState["CachedTables"] = value; }
        }

        private Dictionary<string, DataTable> CachedColumns
        {
            get { return ViewState["CachedColumns"] as Dictionary<string, DataTable>; }
            set { ViewState["CachedColumns"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTables();
            }
            else
            {
                // On postback, ensure dropdown still has items
                if (ddlTables.Items.Count == 0)
                {
                    LoadTables();
                }
            }
        }

        private void LoadTables()
        {
            try
            {
                // Use cached tables if available
                DataTable tables = CachedTables;
                if (tables == null)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        tables = connection.GetSchema("Tables", new string[] { null, null, null, "BASE TABLE" });
                        CachedTables = tables;
                    }
                }

                ddlTables.Items.Clear();
                ddlTables.Items.Add(new ListItem("-- Select Table --", ""));

                foreach (DataRow tableRow in tables.Rows)
                {
                    string tableName = tableRow["TABLE_NAME"].ToString();
                    ddlTables.Items.Add(new ListItem(tableName, tableName));
                }
            }
            catch (Exception ex)
            {
                ShowError("Error loading tables: " + ex.Message);
            }
        }

        protected void ddlTables_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTables.SelectedIndex > 0)
            {
                selectedTable = ddlTables.SelectedValue;
                LoadTableData(selectedTable);
            }
        }

        protected void btnLoadTable_Click(object sender, EventArgs e)
        {
            if (ddlTables.SelectedIndex > 0)
            {
                selectedTable = ddlTables.SelectedValue;
                LoadTableData(selectedTable);
            }
            else
            {
                ShowError("Please select a table first.");
            }
        }

        private void LoadTableData(string tableName)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Get primary key column
                    primaryKeyColumn = GetPrimaryKeyColumn(connection, tableName);

                    // Load data into GridView - removed separate count query for performance
                    string dataQuery = $"SELECT * FROM [{tableName}]";
                    using (SqlCommand dataCommand = new SqlCommand(dataQuery, connection))
                    using (SqlDataAdapter adapter = new SqlDataAdapter(dataCommand))
                    {
                        DataTable tableData = new DataTable();
                        adapter.Fill(tableData);

                        gvData.DataSource = tableData;
                        gvData.DataBind();

                        // Set record count from loaded data
                        lblRecordCount.Text = $"Total Records: {tableData.Rows.Count}";
                    }

                    lblTableName.Text = tableName;
                    pnlData.Visible = true;
                    pnlForm.Visible = false;
                    HideMessages();
                }
            }
            catch (Exception ex)
            {
                ShowError("Error loading table data: " + ex.Message);
            }
        }

        private string GetPrimaryKeyColumn(SqlConnection connection, string tableName)
        {
            try
            {
                string query = @"
                    SELECT COLUMN_NAME
                    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                    WHERE TABLE_NAME = @TableName
                    AND OBJECTPROPERTY(OBJECT_ID(CONSTRAINT_SCHEMA + '.' + CONSTRAINT_NAME), 'IsPrimaryKey') = 1";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TableName", tableName);
                    object result = command.ExecuteScalar();
                    return result != null ? result.ToString() : string.Empty;
                }
            }
            catch
            {
                return string.Empty;
            }
        }

        protected void btnShowInsert_Click(object sender, EventArgs e)
        {
            // Ensure tables are loaded
            if (ddlTables.Items.Count <= 1)
            {
                LoadTables();
            }

            if (ddlTables.SelectedIndex > 0)
            {
                selectedTable = ddlTables.SelectedValue;
                isEditMode = false;
                HideMessages();
                ShowForm(selectedTable);
            }
            else
            {
                ShowError("Please select a table first.");
            }
        }

        private void ShowForm(string tableName)
        {
            try
            {
                // Use cached columns if available
                DataTable columns = null;
                if (CachedColumns != null && CachedColumns.ContainsKey(tableName))
                {
                    columns = CachedColumns[tableName];
                }
                else
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        columns = connection.GetSchema("Columns", new string[] { null, null, tableName });

                        if (CachedColumns == null)
                            CachedColumns = new Dictionary<string, DataTable>();
                        CachedColumns[tableName] = columns;
                    }
                }

                phFormFields.Controls.Clear();

                if (columns.Rows.Count == 0)
                {
                    ShowError("No columns found in table: " + tableName);
                    return;
                }

                foreach (DataRow columnRow in columns.Rows)
                {
                    string columnName = columnRow["COLUMN_NAME"].ToString();
                    string dataType = columnRow["DATA_TYPE"].ToString();
                    bool isNullable = columnRow["IS_NULLABLE"].ToString() == "YES";

                    // Skip identity columns and computed columns
                    if (columns.Columns.Contains("IS_IDENTITY") && columnRow["IS_IDENTITY"] != DBNull.Value && Convert.ToBoolean(columnRow["IS_IDENTITY"]))
                        continue;

                    Panel formGroup = new Panel();
                    formGroup.CssClass = "form-group";

                    Label label = new Label();
                    label.Text = columnName + (isNullable ? "" : " *");
                    label.AssociatedControlID = "txt_" + columnName;
                    formGroup.Controls.Add(label);

                    TextBox textBox = new TextBox();
                    textBox.ID = "txt_" + columnName;
                    textBox.CssClass = "form-control";

                    if (dataType.Contains("char") || dataType.Contains("text"))
                    {
                        textBox.TextMode = TextBoxMode.MultiLine;
                        textBox.Rows = 3;
                    }
                    else if (dataType.Contains("date"))
                    {
                        textBox.TextMode = TextBoxMode.Date;
                    }

                    formGroup.Controls.Add(textBox);
                    phFormFields.Controls.Add(formGroup);
                }

                formTitle.InnerText = isEditMode ? "Edit Record" : "Add New Record";
                pnlForm.Visible = true;
                pnlData.Visible = false;
                HideMessages();
            }
            catch (Exception ex)
            {
                ShowError("Error loading form: " + ex.Message);
                pnlForm.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(selectedTable))
            {
                ShowError("Please select a table first.");
                return;
            }

            try
            {
                // Use cached columns if available
                DataTable columns = null;
                if (CachedColumns != null && CachedColumns.ContainsKey(selectedTable))
                {
                    columns = CachedColumns[selectedTable];
                }
                else
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        columns = connection.GetSchema("Columns", new string[] { null, null, selectedTable });

                        if (CachedColumns == null)
                            CachedColumns = new Dictionary<string, DataTable>();
                        CachedColumns[selectedTable] = columns;
                    }
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    List<string> columnNames = new List<string>();
                    List<string> parameterNames = new List<string>();
                    List<SqlParameter> parameters = new List<SqlParameter>();

                    foreach (DataRow columnRow in columns.Rows)
                    {
                        string columnName = columnRow["COLUMN_NAME"].ToString();
                        string dataType = columnRow["DATA_TYPE"].ToString();

                        // Skip identity columns for insert
                        if (!isEditMode && columns.Columns.Contains("IS_IDENTITY") && columnRow["IS_IDENTITY"] != DBNull.Value && Convert.ToBoolean(columnRow["IS_IDENTITY"]))
                            continue;

                        // Try to get value from form directly if FindControl fails
                        string columnValue = string.Empty;
                        TextBox textBox = phFormFields.FindControl("txt_" + columnName) as TextBox;
                        if (textBox != null)
                        {
                            columnValue = textBox.Text;
                        }
                        else
                        {
                            // Fallback to Request.Form for dynamically created controls
                            columnValue = Request.Form["txt_" + columnName] ?? string.Empty;
                        }

                        // Always add the column with its value
                        columnNames.Add($"[{columnName}]");
                        parameterNames.Add($"@{columnName}");

                        SqlParameter param = new SqlParameter($"@{columnName}", GetSqlDbType(dataType));
                        param.Value = string.IsNullOrWhiteSpace(columnValue) ? DBNull.Value : (object)columnValue;
                        parameters.Add(param);
                    }

                    // Validate that we have columns to save
                    if (columnNames.Count == 0)
                    {
                        ShowError("No columns available to save. This may be due to all columns being identity columns.");
                        return;
                    }

                    string query;
                    if (isEditMode && !string.IsNullOrEmpty(primaryKeyColumn))
                    {
                        // UPDATE
                        string setClause = string.Join(", ", columnNames.ConvertAll(c => $"{c} = {parameterNames[columnNames.IndexOf(c)]}"));
                        query = $"UPDATE [{selectedTable}] SET {setClause} WHERE [{primaryKeyColumn}] = @PrimaryKey";

                        TextBox idTextBox = phFormFields.FindControl("txt_" + primaryKeyColumn) as TextBox;
                        if (idTextBox != null)
                        {
                            parameters.Add(new SqlParameter("@PrimaryKey", Convert.ToInt32(idTextBox.Text)));
                        }
                    }
                    else
                    {
                        // INSERT
                        string columnsClause = string.Join(", ", columnNames);
                        string valuesClause = string.Join(", ", parameterNames);
                        query = $"INSERT INTO [{selectedTable}] ({columnsClause}) VALUES ({valuesClause})";
                    }

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddRange(parameters.ToArray());
                        command.ExecuteNonQuery();
                    }

                    ShowSuccess(isEditMode ? "Record updated successfully!" : "Record added successfully!");
                    pnlForm.Visible = false;
                    LoadTableData(selectedTable);
                }
            }
            catch (Exception ex)
            {
                ShowError("Error saving record: " + ex.Message);
            }
        }

        private SqlDbType GetSqlDbType(string dataType)
        {
            switch (dataType.ToLower())
            {
                case "int":
                case "tinyint":
                case "smallint":
                    return SqlDbType.Int;
                case "bigint":
                    return SqlDbType.BigInt;
                case "bit":
                    return SqlDbType.Bit;
                case "datetime":
                case "date":
                    return SqlDbType.DateTime;
                case "decimal":
                case "numeric":
                    return SqlDbType.Decimal;
                case "float":
                    return SqlDbType.Float;
                case "real":
                    return SqlDbType.Real;
                case "money":
                case "smallmoney":
                    return SqlDbType.Money;
                case "uniqueidentifier":
                    return SqlDbType.UniqueIdentifier;
                default:
                    return SqlDbType.NVarChar;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlForm.Visible = false;
            if (!string.IsNullOrEmpty(selectedTable))
            {
                LoadTableData(selectedTable);
            }
        }

        protected void gvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvData.Rows[rowIndex];

                if (!string.IsNullOrEmpty(primaryKeyColumn))
                {
                    try
                    {
                        int id = Convert.ToInt32(row.Cells[2].Text); // Assuming ID is in third column after buttons

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();
                            string query = $"DELETE FROM [{selectedTable}] WHERE [{primaryKeyColumn}] = @Id";
                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                command.Parameters.AddWithValue("@Id", id);
                                command.ExecuteNonQuery();
                            }
                        }

                        ShowSuccess("Record deleted successfully!");
                        LoadTableData(selectedTable);
                    }
                    catch (Exception ex)
                    {
                        ShowError("Error deleting record: " + ex.Message);
                    }
                }
                else
                {
                    ShowError("Cannot delete: No primary key found for this table.");
                }
            }
            else if (e.CommandName == "EditRecord")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvData.Rows[rowIndex];

                if (!string.IsNullOrEmpty(primaryKeyColumn))
                {
                    try
                    {
                        editRecordId = Convert.ToInt32(row.Cells[2].Text);
                        isEditMode = true;
                        ShowEditForm(selectedTable, row);
                    }
                    catch (Exception ex)
                    {
                        ShowError("Error loading record for edit: " + ex.Message);
                    }
                }
                else
                {
                    ShowError("Cannot edit: No primary key found for this table.");
                }
            }
        }

        private void ShowEditForm(string tableName, GridViewRow row)
        {
            try
            {
                // Use cached columns if available
                DataTable columns = null;
                if (CachedColumns != null && CachedColumns.ContainsKey(tableName))
                {
                    columns = CachedColumns[tableName];
                }
                else
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        columns = connection.GetSchema("Columns", new string[] { null, null, tableName });

                        if (CachedColumns == null)
                            CachedColumns = new Dictionary<string, DataTable>();
                        CachedColumns[tableName] = columns;
                    }
                }

                phFormFields.Controls.Clear();
                int cellIndex = 2; // Start after button columns

                foreach (DataRow columnRow in columns.Rows)
                {
                    string columnName = columnRow["COLUMN_NAME"].ToString();
                    string dataType = columnRow["DATA_TYPE"].ToString();

                    Panel formGroup = new Panel();
                    formGroup.CssClass = "form-group";

                    Label label = new Label();
                    label.Text = columnName;
                    formGroup.Controls.Add(label);

                    TextBox textBox = new TextBox();
                    textBox.ID = "txt_" + columnName;
                    textBox.CssClass = "form-control";

                    if (dataType.Contains("char") || dataType.Contains("text"))
                    {
                        textBox.TextMode = TextBoxMode.MultiLine;
                        textBox.Rows = 3;
                    }
                    else if (dataType.Contains("date"))
                    {
                        textBox.TextMode = TextBoxMode.Date;
                    }

                    // Pre-fill with existing data
                    if (cellIndex < row.Cells.Count)
                    {
                        textBox.Text = row.Cells[cellIndex].Text;
                        cellIndex++;
                    }

                    // Make primary key read-only
                    if (columnName == primaryKeyColumn)
                    {
                        textBox.ReadOnly = true;
                        textBox.CssClass += " readonly";
                    }

                    formGroup.Controls.Add(textBox);
                    phFormFields.Controls.Add(formGroup);
                }

                formTitle.InnerText = "Edit Record";
                pnlForm.Visible = true;
                pnlData.Visible = false;
                HideMessages();
            }
            catch (Exception ex)
            {
                ShowError("Error loading edit form: " + ex.Message);
            }
        }

        private void ShowError(string message)
        {
            lblError.Text = message;
            lblError.Visible = true;
            lblSuccess.Visible = false;
        }

        private void ShowSuccess(string message)
        {
            lblSuccess.Text = message;
            lblSuccess.Visible = true;
            lblError.Visible = false;
        }

        private void HideMessages()
        {
            lblError.Visible = false;
            lblSuccess.Visible = false;
        }
    }
}
