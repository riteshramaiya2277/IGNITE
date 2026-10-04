using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IGNITE;

namespace IGNITE.Admin
{
    public partial class Challenges : Page
    {
        private const int PageSize = 10;
        private int currentPage = 1;
        private int totalPages = 1;
        private int totalRecords = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadChallengesData();
                LoadChallengeStats();
            }
        }

        private void LoadCategories()
        {
            DataTable categories = DatabaseHelper.ExecuteQuery("SELECT CategoryId, Name FROM Categories WHERE IsActive = 1 ORDER BY Name");

            ddlCategory.Items.Clear();
            ddlCategory.Items.Add(new ListItem("Category: All", ""));

            foreach (DataRow row in categories.Rows)
            {
                ddlCategory.Items.Add(new ListItem(row["Name"].ToString(), row["CategoryId"].ToString()));
            }
        }

        private void LoadChallengesData()
        {
            try
            {
                GetPageFromQueryString();

                string search = txtSearch.Text.Trim();
                int? category = string.IsNullOrEmpty(ddlCategory.SelectedValue) ? (int?)null : int.Parse(ddlCategory.SelectedValue);
                string status = ddlStatus.SelectedValue;
                string sortBy = ddlSort.SelectedValue;

                totalRecords = GetChallengesCount(search, category, status);
                totalPages = (int)Math.Ceiling(totalRecords / (double)PageSize);

                if (currentPage > totalPages && totalPages > 0)
                    currentPage = totalPages;
                if (currentPage < 1)
                    currentPage = 1;

                DataTable challengesData = GetChallenges(search, category, status, sortBy, currentPage, PageSize);

                BuildTableRows(challengesData);
                UpdatePaginationUI();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading challenges: " + ex.Message);
            }
        }

        private int GetChallengesCount(string search, int? category, string status)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                DatabaseHelper.CreateParam("@Search", search),
                DatabaseHelper.CreateParam("@Category", category ?? (object)DBNull.Value),
                DatabaseHelper.CreateParam("@Status", status)
            };

            object result = DatabaseHelper.ExecuteScalarStoredProcedure("sp_Challenge_GetCount", parameters);
            return result != null ? Convert.ToInt32(result) : 0;
        }

        private DataTable GetChallenges(string search, int? category, string status, string sortBy, int page, int pageSize)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                DatabaseHelper.CreateParam("@Search", search),
                DatabaseHelper.CreateParam("@Category", category ?? (object)DBNull.Value),
                DatabaseHelper.CreateParam("@Status", status),
                DatabaseHelper.CreateParam("@SortBy", sortBy),
                DatabaseHelper.CreateParam("@Page", page),
                DatabaseHelper.CreateParam("@PageSize", pageSize)
            };

            return DatabaseHelper.ExecuteStoredProcedure("sp_Challenge_GetAllForAdmin", parameters);
        }

        private void BuildTableRows(DataTable challengesData)
        {
            phChallengesTable.Controls.Clear();

            if (challengesData.Rows.Count == 0)
            {
                phChallengesTable.Controls.Add(new LiteralControl("<tr><td colspan='8' style='text-align:center; padding:40px; color:#888;'>No challenges found</td></tr>"));
                return;
            }

            foreach (DataRow row in challengesData.Rows)
            {
                HtmlTableRow tr = new HtmlTableRow();

                int challengeId = DatabaseHelper.GetInt(row, "ChallengeId");
                string title = DatabaseHelper.GetString(row, "Title");
                string categoryName = DatabaseHelper.GetString(row, "CategoryName", "N/A");
                string difficulty = DatabaseHelper.GetString(row, "Difficulty", "Medium");
                string requirementType = DatabaseHelper.GetString(row, "RequirementType", "");
                DateTime startDate = DatabaseHelper.GetDateTime(row, "StartDate");
                DateTime endDate = DatabaseHelper.GetDateTime(row, "EndDate");
                int xpReward = DatabaseHelper.GetInt(row, "XPReward", 0);
                bool isPublished = DatabaseHelper.GetBool(row, "IsPublished", false);
                bool isActive = DatabaseHelper.GetBool(row, "IsActive", true);

                // Challenge Title cell
                HtmlTableCell tdTitle = new HtmlTableCell();
                tdTitle.InnerHtml = string.Format(@"
                    <a href=""ChallengeDetails.aspx?id={0}"" class=""chal-title"">{1}</a>
                    <div class=""chal-ref"">Ref: #CHL-{2:D4}</div>", challengeId, title, challengeId);
                tr.Cells.Add(tdTitle);

                // Category cell
                HtmlTableCell tdCategory = new HtmlTableCell();
                tdCategory.InnerText = categoryName;
                tdCategory.Attributes["class"] = "chal-category";
                tr.Cells.Add(tdCategory);

                // Difficulty cell
                HtmlTableCell tdDifficulty = new HtmlTableCell();
                string diffClass = difficulty.ToLower();
                tdDifficulty.InnerHtml = string.Format("<span class=\"badge-diff badge-{0}\">{1}</span>", diffClass, difficulty.ToUpper());
                tr.Cells.Add(tdDifficulty);

                // Requirement cell
                HtmlTableCell tdRequirement = new HtmlTableCell();
                tdRequirement.InnerText = requirementType;
                tdRequirement.Attributes["class"] = "chal-req";
                tr.Cells.Add(tdRequirement);

                // Timeline cell
                HtmlTableCell tdTimeline = new HtmlTableCell();
                tdTimeline.InnerHtml = string.Format(@"
                    <div class=""chal-timeline"">
                        {0}<br/>
                        {1}
                    </div>", startDate.ToString("MMM dd, yyyy"), endDate.ToString("MMM dd, yyyy"));
                tr.Cells.Add(tdTimeline);

                // XP Reward cell
                HtmlTableCell tdXP = new HtmlTableCell();
                tdXP.InnerHtml = string.Format("<div class=\"xp-reward\"><div class=\"xp-dot\"></div>{0:N0} XP</div>", xpReward);
                tr.Cells.Add(tdXP);

                // Status cell
                HtmlTableCell tdStatus = new HtmlTableCell();
                string statusClass = isPublished ? "published" : "draft";
                if (!isActive) statusClass = "archived";
                string statusText = isPublished ? "Published" : "Draft";
                if (!isActive) statusText = "Archived";
                tdStatus.InnerHtml = string.Format("<div class=\"status {0}\"><div class=\"status-dot\"></div>{1}</div>", statusClass, statusText);
                tr.Cells.Add(tdStatus);

                // Actions cell
                HtmlTableCell tdActions = new HtmlTableCell();
                tdActions.InnerHtml = string.Format(@"
                    <div class=""action-btns"" onclick=""event.stopPropagation();"">
                        <a href=""ChallengeDetails.aspx?id={0}"" title=""View Details"" style=""color:inherit;""><svg viewBox=""0 0 24 24"" fill=""none"" stroke=""currentColor"" stroke-width=""2""><path d=""M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z""></path><circle cx=""12"" cy=""12"" r=""3""></circle></svg></a>
                        <a href=""EditChallenge.aspx?id={0}"" title=""Edit Challenge"" style=""color:inherit;""><svg viewBox=""0 0 24 24"" fill=""none"" stroke=""currentColor"" stroke-width=""2""><path d=""M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7""></path><path d=""M18.5 2.5a2.12 2.12 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z""></path></svg></a>
                    </div>", challengeId);
                tr.Cells.Add(tdActions);

                phChallengesTable.Controls.Add(tr);
            }
        }

        private void UpdatePaginationUI()
        {
            int startRecord = (currentPage - 1) * PageSize + 1;
            int endRecord = Math.Min(currentPage * PageSize, totalRecords);
            litPaginationText.Text = string.Format("Showing {0}-{1} of {2:N0} challenges", startRecord, endRecord, totalRecords);

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

            btnPrev.Enabled = currentPage > 1;
            btnNext.Enabled = currentPage < totalPages;
        }

        private void LoadChallengeStats()
        {
            DataTable stats = DatabaseHelper.ExecuteStoredProcedure("sp_Challenge_GetAdminStats");

            if (stats.Rows.Count > 0)
            {
                DataRow row = stats.Rows[0];
                litActiveChallenges.Text = DatabaseHelper.GetInt(row, "ActiveChallenges").ToString();
                litTotalSubmissions.Text = DatabaseHelper.GetInt(row, "TotalSubmissions").ToString("N0");

                decimal avgCompletion = DatabaseHelper.GetDecimal(row, "AvgCompletion");
                litAvgCompletion.Text = avgCompletion.ToString("F0") + "%";
                litCompletionPercent.Text = avgCompletion.ToString("F0");

                decimal xpDistributed = DatabaseHelper.GetDecimal(row, "XPDistributed");
                litXPDistributed.Text = xpDistributed >= 1000 ? (xpDistributed / 1000).ToString("F1") + "k" : xpDistributed.ToString("N0");
            }
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
                Response.Redirect(string.Format("Challenges.aspx?page={0}&search={1}&category={2}&status={3}&sort={4}",
                    currentPage, txtSearch.Text, ddlCategory.SelectedValue, ddlStatus.SelectedValue, ddlSort.SelectedValue));
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (currentPage < totalPages)
            {
                currentPage++;
                Response.Redirect(string.Format("Challenges.aspx?page={0}&search={1}&category={2}&status={3}&sort={4}",
                    currentPage, txtSearch.Text, ddlCategory.SelectedValue, ddlStatus.SelectedValue, ddlSort.SelectedValue));
            }
        }

        protected void PageNumber_Click(object sender, CommandEventArgs e)
        {
            int pageNumber;
            if (int.TryParse(e.CommandArgument.ToString(), out pageNumber))
            {
                Response.Redirect(string.Format("Challenges.aspx?page={0}&search={1}&category={2}&status={3}&sort={4}",
                    pageNumber, txtSearch.Text, ddlCategory.SelectedValue, ddlStatus.SelectedValue, ddlSort.SelectedValue));
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            currentPage = 1;
            LoadChallengesData();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            currentPage = 1;
            LoadChallengesData();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            currentPage = 1;
            LoadChallengesData();
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            currentPage = 1;
            LoadChallengesData();
        }
    }
}
