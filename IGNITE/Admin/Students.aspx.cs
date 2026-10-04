using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace IGNITE.Admin
{
    public partial class Students : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["IGNITEConnection"].ConnectionString;
        private const int PageSize = 5;
        private int currentPage = 1;
        private int totalPages = 1;
        private int totalRecords = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get current page from query string
                if (Request.QueryString["page"] != null)
                {
                    int.TryParse(Request.QueryString["page"], out currentPage);
                    if (currentPage < 1) currentPage = 1;
                }

                LoadStudentsData();
            }
        }

        private void LoadStudentsData()
        {
            try
            {
                totalRecords = GetTotalStudentsCount();
                totalPages = (int)Math.Ceiling(totalRecords / (double)PageSize);

                // Ensure current page is valid
                if (currentPage > totalPages && totalPages > 0)
                    currentPage = totalPages;
                if (currentPage < 1)
                    currentPage = 1;

                // Get paginated data
                DataTable studentsData = GetPaginatedStudents(currentPage, PageSize);

                // Build table rows
                BuildTableRows(studentsData);

                // Update pagination UI
                UpdatePaginationUI();
            }
            catch (Exception ex)
            {
                // Handle error - could display error message
                System.Diagnostics.Debug.WriteLine("Error loading students: " + ex.Message);
            }
        }

        private int GetTotalStudentsCount()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM Users WHERE Role = 'Student'";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    return (int)command.ExecuteScalar();
                }
            }
        }

        private DataTable GetPaginatedStudents(int page, int pageSize)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                int offset = (page - 1) * pageSize;

                string query = @"
                    SELECT 
                        u.UserId,
                        u.FullName,
                        u.Email,
                        u.College,
                        u.Course,
                        u.Year,
                        u.Semester,
                        u.TotalXP,
                        l.LevelNumber,
                        l.Title,
                        u.IsActive,
                        u.CreatedAt,
                        u.UpdatedAt
                    FROM Users u
                    LEFT JOIN Levels l ON u.CurrentLevelId = l.LevelId
                    WHERE u.Role = 'Student'
                    ORDER BY u.CreatedAt DESC
                    OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Offset", offset);
                    command.Parameters.AddWithValue("@PageSize", pageSize);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable table = new DataTable();
                        adapter.Fill(table);
                        return table;
                    }
                }
            }
        }

        private void BuildTableRows(DataTable studentsData)
        {
            phStudentsTable.Controls.Clear();

            string[] avatarClasses = { "avatar-red", "avatar-pink", "avatar-rose", "avatar-purple" };
            int avatarIndex = 0;

            foreach (DataRow row in studentsData.Rows)
            {
                HtmlTableRow tr = new HtmlTableRow();

                // Student Name cell
                HtmlTableCell tdName = new HtmlTableCell();
                string avatarClass = avatarClasses[avatarIndex % avatarClasses.Length];
                avatarIndex++;

                tdName.InnerHtml = string.Format(@"
                    <div class=""student-info"">
                        <div class=""avatar {0}""></div>
                        <div>
                            <div class=""student-name"">{1}</div>
                            <div class=""student-id"">ID: #STU-{2:D4}</div>
                        </div>
                    </div>", avatarClass, row["FullName"], row["UserId"]);
                tr.Cells.Add(tdName);

                // Course cell
                HtmlTableCell tdCourse = new HtmlTableCell();
                string college = row["College"] != DBNull.Value ? row["College"].ToString() : "N/A";
                string course = row["Course"] != DBNull.Value ? row["Course"].ToString() : "N/A";
                tdCourse.InnerHtml = string.Format(@"
                    <div class=""course-name"">{0}</div>
                    <div class=""course-dept"">{1}</div>", college, course);
                tr.Cells.Add(tdCourse);

                // Year/Semester cell
                HtmlTableCell tdYear = new HtmlTableCell();
                int year = row["Year"] != DBNull.Value ? Convert.ToInt32(row["Year"]) : 0;
                int semester = row["Semester"] != DBNull.Value ? Convert.ToInt32(row["Semester"]) : 0;
                string yearOrdinal = GetOrdinal(year);
                tdYear.InnerText = string.Format("{0} Year / {1}", yearOrdinal, semester);
                tr.Cells.Add(tdYear);

                // Level cell
                HtmlTableCell tdLevel = new HtmlTableCell();
                int levelNumber = row["LevelNumber"] != DBNull.Value ? Convert.ToInt32(row["LevelNumber"]) : 1;
                tdLevel.InnerText = levelNumber.ToString();
                tr.Cells.Add(tdLevel);

                // XP cell
                HtmlTableCell tdXP = new HtmlTableCell();
                int totalXP = row["TotalXP"] != DBNull.Value ? Convert.ToInt32(row["TotalXP"]) : 0;
                tdXP.InnerText = string.Format("{0:N0} XP", totalXP);
                tdXP.Attributes["class"] = "text-pink";
                tr.Cells.Add(tdXP);

                // Streak cell (placeholder for now)
                HtmlTableCell tdStreak = new HtmlTableCell();
                tdStreak.InnerText = "🔥 0";
                tdStreak.Attributes["class"] = "text-grey";
                tr.Cells.Add(tdStreak);

                // Active Challenges cell (placeholder for now)
                HtmlTableCell tdChallenges = new HtmlTableCell();
                tdChallenges.InnerText = "0";
                tr.Cells.Add(tdChallenges);

                // Status cell
                HtmlTableCell tdStatus = new HtmlTableCell();
                bool isActive = row["IsActive"] != DBNull.Value && Convert.ToBoolean(row["IsActive"]);
                string statusClass = isActive ? "active" : "inactive";
                string statusText = isActive ? "Active" : "Inactive";
                tdStatus.InnerHtml = string.Format("<span class=\"status-badge {0}\">{1}</span>", statusClass, statusText);
                tr.Cells.Add(tdStatus);

                // Last Active cell
                HtmlTableCell tdLastActive = new HtmlTableCell();
                DateTime updatedAt = row["UpdatedAt"] != DBNull.Value ? Convert.ToDateTime(row["UpdatedAt"]) : DateTime.Now;
                tdLastActive.InnerText = GetRelativeTime(updatedAt);
                tdLastActive.Attributes["class"] = "text-grey";
                tr.Cells.Add(tdLastActive);

                // Actions cell
                HtmlTableCell tdActions = new HtmlTableCell();
                tdActions.InnerHtml = string.Format(@"
                    <div class=""action-buttons"">
                        <a href=""StudentProfile.aspx?id={0}"" class=""btn-view"" style=""text-decoration:none;"">VIEW</a>
                        <button type=""button"" class=""btn-more""><svg viewBox=""0 0 24 24"" width=""16"" height=""16"" fill=""none"" stroke=""currentColor"" stroke-width=""2"" stroke-linecap=""round"" stroke-linejoin=""round""><circle cx=""12"" cy=""12"" r=""1""></circle><circle cx=""12"" cy=""5"" r=""1""></circle><circle cx=""12"" cy=""19"" r=""1""></circle></svg></button>
                    </div>", row["UserId"]);
                tr.Cells.Add(tdActions);

                phStudentsTable.Controls.Add(tr);
            }
        }

        private void UpdatePaginationUI()
        {
            // Update total count
            litTotalCount.Text = totalRecords.ToString("N0");

            // Update pagination text
            int startRecord = (currentPage - 1) * PageSize + 1;
            int endRecord = Math.Min(currentPage * PageSize, totalRecords);
            litPaginationText.Text = string.Format("Showing {0}-{1} of {2:N0} students", startRecord, endRecord, totalRecords);

            // Build page numbers
            phPageNumbers.Controls.Clear();
            for (int i = 1; i <= totalPages; i++)
            {
                LinkButton pageBtn = new LinkButton();
                pageBtn.Text = i.ToString();
                pageBtn.CssClass = "page-btn";
                if (i == currentPage)
                    pageBtn.CssClass += " active";
                pageBtn.Command += new CommandEventHandler(PageNumber_Click);
                pageBtn.CommandArgument = i.ToString();
                phPageNumbers.Controls.Add(pageBtn);
            }

            // Enable/disable prev/next buttons
            btnPrev.Enabled = currentPage > 1;
            btnNext.Enabled = currentPage < totalPages;
        }

        private string GetOrdinal(int number)
        {
            if (number <= 0) return number.ToString();

            switch (number % 100)
            {
                case 11:
                case 12:
                case 13:
                    return number + "th";
            }

            switch (number % 10)
            {
                case 1:
                    return number + "st";
                case 2:
                    return number + "nd";
                case 3:
                    return number + "rd";
                default:
                    return number + "th";
            }
        }

        private string GetRelativeTime(DateTime dateTime)
        {
            TimeSpan span = DateTime.Now - dateTime;

            if (span.TotalMinutes < 1)
                return "Just now";
            if (span.TotalMinutes < 60)
                return string.Format("{0} minutes ago", (int)span.TotalMinutes);
            if (span.TotalHours < 24)
                return string.Format("{0} hours ago", (int)span.TotalHours);
            if (span.TotalDays < 7)
                return string.Format("{0} days ago", (int)span.TotalDays);
            if (span.TotalDays < 30)
                return string.Format("{0} weeks ago", (int)(span.TotalDays / 7));

            return dateTime.ToString("MMM dd, yyyy");
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (currentPage > 1)
            {
                currentPage--;
                Response.Redirect(string.Format("Students.aspx?page={0}", currentPage));
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (currentPage < totalPages)
            {
                currentPage++;
                Response.Redirect(string.Format("Students.aspx?page={0}", currentPage));
            }
        }

        protected void PageNumber_Click(object sender, CommandEventArgs e)
        {
            int pageNumber;
            if (int.TryParse(e.CommandArgument.ToString(), out pageNumber))
            {
                Response.Redirect(string.Format("Students.aspx?page={0}", pageNumber));
            }
        }
    }
}
