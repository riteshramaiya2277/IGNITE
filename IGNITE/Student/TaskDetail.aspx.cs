using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class TaskDetail : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTaskDetails();
            }
        }

        private void LoadTaskDetails()
        {
            string taskId = Request.QueryString["taskId"] ?? "1";

            switch (taskId)
            {
                case "2":
                    SetTaskData(
                        "Renaissance Art History Essay",
                        "HISTORY",
                        "IN PROGRESS",
                        "badge-subject-history",
                        "Tomorrow, 5:00 PM",
                        "Medium Priority",
                        "500",
                        "Drafting the second section about the influence of patronage in Florence. Analyze how the Medici family funded architectural marvels and artistic commissions.",
                        "Semester GPA 3.8",
                        40
                    );
                    break;

                case "3":
                    SetTaskData(
                        "Quantum Mechanics Quiz Prep",
                        "PHYSICS",
                        "PENDING",
                        "badge-subject-physics",
                        "May 18, 9:00 AM",
                        "Low Priority",
                        "250",
                        "Reviewing Schrödinger equation and wave-particle duality concepts. Complete practice problems from chapters 3 and 4.",
                        "Physics Mastery",
                        50
                    );
                    break;

                case "4":
                    SetTaskData(
                        "Sociology Case Study",
                        "SOCIOLOGY",
                        "COMPLETED",
                        "badge-subject-sociology",
                        "Submitted May 10",
                        "Medium Priority",
                        "450",
                        "Analyze the impact of social media on urban communities in the 21st century.",
                        "Ace Term 2 Finals",
                        100
                    );
                    break;

                case "1":
                default:
                    // Default matches exact Figma design in screenshot
                    SetTaskData(
                        "Advanced Calculus - Problem Set 4",
                        "MATHEMATICS",
                        "OVERDUE",
                        "badge-subject-math-detail",
                        "May 12, 2024",
                        "High Priority",
                        "250",
                        "Complete exercises 15 through 32 from Chapter 4 on Derivatives. This set focuses on the application of the Chain Rule and implicit differentiation. Please ensure all steps are shown for exercise 24 and 28 as they will be weighted more heavily in the grading rubric.",
                        "Ace Term 2 Finals",
                        65
                    );
                    break;
            }
        }

        private void SetTaskData(
            string title,
            string subject,
            string status,
            string subjectClass,
            string dueDate,
            string priority,
            string potentialXP,
            string description,
            string linkedGoal,
            int goalPercent)
        {
            Title = title;
            lblBreadcrumbTitle.InnerText = title;
            lblTaskTitle.InnerText = title;

            lblSubjectBadge.InnerText = subject;
            lblSubjectBadge.Attributes["class"] = subjectClass;

            if (status.Equals("OVERDUE", StringComparison.OrdinalIgnoreCase))
            {
                lblStatusBadge.Attributes["class"] = "badge-status-overdue-detail";
                lblStatusBadge.InnerHtml = "<span class=\"badge-dot-overdue\"></span><span>OVERDUE</span>";
            }
            else
            {
                lblStatusBadge.Attributes["class"] = "badge-status-overdue-detail";
                lblStatusBadge.Style["background-color"] = "#E0E7FF";
                lblStatusBadge.Style["color"] = "#4F46E5";
                lblStatusBadge.InnerHtml = "<span>" + status + "</span>";
            }

            lblDueDate.InnerText = dueDate;
            lblPriority.InnerText = priority;
            lblPotentialXP.InnerText = potentialXP;
            lblTaskDesc.InnerText = description;

            lblLinkedGoalTitle.InnerText = linkedGoal;
            lblGoalPct.InnerText = goalPercent + "%";
            goalProgressFill.Style["width"] = goalPercent + "%";
        }
    }
}
