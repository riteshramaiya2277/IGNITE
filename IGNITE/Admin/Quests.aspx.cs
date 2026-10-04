using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IGNITE;

namespace IGNITE.Admin
{
    public partial class Quests : Page
    {
        private const int PageSize = 10;
        private int currentPage = 1;
        private int totalPages = 1;
        private int totalRecords = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadQuestsData();
            }
        }

        private void LoadQuestsData()
        {
            try
            {
                GetPageFromQueryString();

                string search = txtSearch.Text.Trim();
                string type = ddlType.SelectedValue;
                string status = ddlStatus.SelectedValue;
                string sortBy = ddlSort.SelectedValue;

                totalRecords = GetQuestsCount(search, type, status);
                totalPages = (int)Math.Ceiling(totalRecords / (double)PageSize);

                if (currentPage > totalPages && totalPages > 0)
                    currentPage = totalPages;
                if (currentPage < 1)
                    currentPage = 1;

                DataTable questsData = GetQuests(search, type, status, sortBy, currentPage, PageSize);

                BuildTableRows(questsData);
                UpdatePaginationUI();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading quests: " + ex.Message);
            }
        }

        private int GetQuestsCount(string search, string type, string status)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                DatabaseHelper.CreateParam("@Search", search),
                DatabaseHelper.CreateParam("@Type", type),
                DatabaseHelper.CreateParam("@Status", status)
            };

            object result = DatabaseHelper.ExecuteScalarStoredProcedure("sp_Quest_GetCount", parameters);
            return result != null ? Convert.ToInt32(result) : 0;
        }

        private DataTable GetQuests(string search, string type, string status, string sortBy, int page, int pageSize)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                DatabaseHelper.CreateParam("@Search", search),
                DatabaseHelper.CreateParam("@Type", type),
                DatabaseHelper.CreateParam("@Status", status),
                DatabaseHelper.CreateParam("@SortBy", sortBy),
                DatabaseHelper.CreateParam("@Page", page),
                DatabaseHelper.CreateParam("@PageSize", pageSize)
            };

            return DatabaseHelper.ExecuteStoredProcedure("sp_Quest_GetAllForAdmin", parameters);
        }

        private void BuildTableRows(DataTable questsData)
        {
            phQuestsTable.Controls.Clear();

            if (questsData.Rows.Count == 0)
            {
                phQuestsTable.Controls.Add(new LiteralControl("<tr><td colspan='8' style='text-align:center; padding:40px; color:#888;'>No quests found</td></tr>"));
                return;
            }

            foreach (DataRow row in questsData.Rows)
            {
                HtmlTableRow tr = new HtmlTableRow();

                int questId = DatabaseHelper.GetInt(row, "QuestId");
                string title = DatabaseHelper.GetString(row, "Title");
                string questType = DatabaseHelper.GetString(row, "QuestType", "Automatic");
                string requirementValue = DatabaseHelper.GetString(row, "RequirementValue", "");
                int xpReward = DatabaseHelper.GetInt(row, "XPReward", 0);
                bool isPublished = DatabaseHelper.GetBool(row, "IsPublished", false);
                bool isActive = DatabaseHelper.GetBool(row, "IsActive", true);
                DateTime? startDate = row["StartDate"] != DBNull.Value ? DatabaseHelper.GetDateTime(row, "StartDate") : (DateTime?)null;
                DateTime? endDate = row["EndDate"] != DBNull.Value ? DatabaseHelper.GetDateTime(row, "EndDate") : (DateTime?)null;
                DateTime createdAt = DatabaseHelper.GetDateTime(row, "CreatedAt");

                // Quest Name cell
                HtmlTableCell tdName = new HtmlTableCell();
                tdName.InnerHtml = string.Format(@"
                    <div class=""quest-name-col"">
                        <div class=""quest-icon-badge"">
                            <svg viewBox=""0 0 24 24"" width=""18"" height=""18"" fill=""none"" stroke=""#D96A77""
                                stroke-width=""2"" stroke-linecap=""round"" stroke-linejoin=""round""
                                style=""width:18px;height:18px;"">
                                <path d=""M4 19.5A2.5 2.5 0 0 1 6.5 17H20""></path>
                                <path d=""M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z""></path>
                            </svg>
                        </div>
                        <span class=""quest-title-text"">{0}</span>
                    </div>", title);
                tr.Cells.Add(tdName);

                // Type cell
                HtmlTableCell tdType = new HtmlTableCell();
                tdType.InnerHtml = string.Format("<span class=\"quest-type-text\">{0}</span>", questType);
                tr.Cells.Add(tdType);

                // Requirement cell
                HtmlTableCell tdRequirement = new HtmlTableCell();
                tdRequirement.InnerHtml = string.Format("<span class=\"quest-req-text\">{0}</span>", requirementValue);
                tr.Cells.Add(tdRequirement);

                // XP Reward cell
                HtmlTableCell tdXP = new HtmlTableCell();
                tdXP.InnerHtml = string.Format(@"
                    <div class=""quest-xp-badge"">
                        <svg viewBox=""0 0 24 24"" width=""12"" height=""12"" style=""width:12px;height:12px;"">
                            <polygon points=""13 2 3 14 12 14 11 22 21 10 12 10 13 2""></polygon>
                        </svg>
                        <span>{0:N0} XP</span>
                    </div>", xpReward);
                tr.Cells.Add(tdXP);

                // Status cell
                HtmlTableCell tdStatus = new HtmlTableCell();
                string statusClass = isPublished ? "status-published" : "status-draft";
                if (!isActive) statusClass = "status-archived";
                string statusText = isPublished ? "Published" : "Draft";
                if (!isActive) statusText = "Archived";
                tdStatus.InnerHtml = string.Format("<span class=\"status-pill {0}\">{1}</span>", statusClass, statusText);
                tr.Cells.Add(tdStatus);

                // Dates cell
                HtmlTableCell tdDates = new HtmlTableCell();
                string datesHtml = "";
                if (startDate.HasValue && endDate.HasValue)
                {
                    datesHtml = string.Format(@"
                        <div class=""dates-stack"">
                            <span class=""dates-primary"">{0} - {1}</span>
                            <span class=""dates-sub"">Ongoing</span>
                        </div>", startDate.Value.ToString("MMM dd"), endDate.Value.ToString("MMM dd"));
                }
                else
                {
                    datesHtml = string.Format("<span class=\"dates-sub\">Not set</span>");
                }
                tdDates.InnerHtml = datesHtml;
                tr.Cells.Add(tdDates);

                // Created cell
                HtmlTableCell tdCreated = new HtmlTableCell();
                tdCreated.InnerHtml = string.Format("<span class=\"created-date-text\">{0}</span>", createdAt.ToString("MMM dd, yyyy"));
                tr.Cells.Add(tdCreated);

                // Actions cell
                HtmlTableCell tdActions = new HtmlTableCell();
                string actionButton = isPublished ? "btn-row-archive" : "btn-row-publish";
                string actionText = isPublished ? "Archive" : "Publish";
                tdActions.InnerHtml = string.Format(@"
                    <div class=""actions-cell-wrap"">
                        <a href=""javascript:void(0);"" class=""action-icon-link"" title=""View Quest"">
                            <svg viewBox=""0 0 24 24"" width=""16"" height=""16"" fill=""none""
                                stroke=""currentColor"" stroke-width=""2"" style=""width:16px;height:16px;"">
                                <path d=""M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z""></path>
                                <circle cx=""12"" cy=""12"" r=""3""></circle>
                            </svg>
                        </a>
                        <a href=""javascript:void(0);"" class=""action-icon-link"" title=""Edit Quest"">
                            <svg viewBox=""0 0 24 24"" width=""16"" height=""16"" fill=""none""
                                stroke=""currentColor"" stroke-width=""2"" style=""width:16px;height:16px;"">
                                <path d=""M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7""></path>
                                <path d=""M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z""></path>
                            </svg>
                        </a>
                        <button type=""button"" class=""{0}"">{1}</button>
                    </div>", actionButton, actionText);
                tr.Cells.Add(tdActions);

                phQuestsTable.Controls.Add(tr);
            }
        }

        private void UpdatePaginationUI()
        {
            int startRecord = (currentPage - 1) * PageSize + 1;
            int endRecord = Math.Min(currentPage * PageSize, totalRecords);
            litPaginationText.Text = string.Format("Showing {0}-{1} of {2:N0} quests", startRecord, endRecord, totalRecords);

            phPageNumbers.Controls.Clear();
            for (int i = 1; i <= totalPages; i++)
            {
                LinkButton pageBtn = new LinkButton();
                pageBtn.Text = i.ToString();
                pageBtn.CssClass = "page-num-btn";
                if (i == currentPage)
                    pageBtn.CssClass += " active";
                pageBtn.Command += new CommandEventHandler(PageNumber_Click);
                pageBtn.CommandArgument = i.ToString();
                phPageNumbers.Controls.Add(pageBtn);
            }

            btnPrev.Enabled = currentPage > 1;
            btnNext.Enabled = currentPage < totalPages;
        }

        private void GetPageFromQueryString()
        {
            if (Request.QueryString["page"] != null)
            {
                int.TryParse(Request.QueryString["page"], out currentPage);
                if (currentPage < 1) currentPage = 1;
            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (currentPage > 1)
            {
                currentPage--;
                Response.Redirect(string.Format("Quests.aspx?page={0}&search={1}&type={2}&status={3}&sort={4}",
                    currentPage, txtSearch.Text, ddlType.SelectedValue, ddlStatus.SelectedValue, ddlSort.SelectedValue));
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (currentPage < totalPages)
            {
                currentPage++;
                Response.Redirect(string.Format("Quests.aspx?page={0}&search={1}&type={2}&status={3}&sort={4}",
                    currentPage, txtSearch.Text, ddlType.SelectedValue, ddlStatus.SelectedValue, ddlSort.SelectedValue));
            }
        }

        protected void PageNumber_Click(object sender, CommandEventArgs e)
        {
            int pageNumber;
            if (int.TryParse(e.CommandArgument.ToString(), out pageNumber))
            {
                Response.Redirect(string.Format("Quests.aspx?page={0}&search={1}&type={2}&status={3}&sort={4}",
                    pageNumber, txtSearch.Text, ddlType.SelectedValue, ddlStatus.SelectedValue, ddlSort.SelectedValue));
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            currentPage = 1;
            LoadQuestsData();
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            currentPage = 1;
            LoadQuestsData();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            currentPage = 1;
            LoadQuestsData();
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            currentPage = 1;
            LoadQuestsData();
        }

        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlType.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlSort.SelectedIndex = 0;
            currentPage = 1;
            LoadQuestsData();
        }

        protected void btnCreateQuest_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateQuest.aspx");
        }
    }
}
