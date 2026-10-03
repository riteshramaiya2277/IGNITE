<%@ Page Title="Archive Achievement — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ArchiveAchievement.aspx.cs" Inherits="IGNITE.Admin.ArchiveAchievement" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-topbar-header {
            display: none !important;
        }

        .archive-modal-page-wrapper {
            position: fixed;
            top: 0;
            left: 240px; /* Sidebar width */
            right: 0;
            bottom: 0;
            background: rgba(245, 242, 235, 0.65);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            z-index: 100;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            box-sizing: border-box;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        @media (max-width: 900px) {
            .archive-modal-page-wrapper {
                left: 0;
            }
        }

        /* Modal Dialog Box matching uploaded image */
        .archive-dialog-card {
            background: #F5F2EB;
            border-radius: 24px;
            width: 100%;
            max-width: 420px;
            padding: 36px 32px 32px 32px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            box-shadow: 0 16px 40px rgba(0, 0, 0, 0.12), 0 2px 8px rgba(0, 0, 0, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.6);
            animation: popIn 0.2s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes popIn {
            from {
                opacity: 0;
                transform: scale(0.92);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* Top Circle Badge with Box Icon */
        .archive-icon-circle {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: #FBEAEB;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .archive-icon-circle svg {
            width: 28px;
            height: 28px;
            color: #D96A77;
        }

        .archive-dialog-title {
            font-size: 20px;
            font-weight: 800;
            color: #1C1917;
            margin: 0 0 10px 0;
            letter-spacing: -0.2px;
        }

        .archive-dialog-desc {
            font-size: 13px;
            color: #57534E;
            line-height: 1.55;
            margin: 0 0 28px 0;
            padding: 0 8px;
        }

        .archive-dialog-desc strong {
            color: #1C1917;
            font-weight: 700;
        }

        /* Buttons Grid */
        .archive-actions-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
            width: 100%;
        }

        .btn-dialog-cancel {
            background: #FFFFFF;
            border: none;
            border-radius: 12px;
            padding: 12px 20px;
            font-size: 14px;
            font-weight: 700;
            color: #44403C;
            cursor: pointer;
            font-family: inherit;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.06);
            transition: all 0.15s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-dialog-cancel:hover {
            background: #EAE6DF;
            color: #1C1917;
        }

        .btn-dialog-confirm {
            background: #D96A77;
            border: none;
            border-radius: 12px;
            padding: 12px 20px;
            font-size: 14px;
            font-weight: 700;
            color: #FFFFFF;
            cursor: pointer;
            font-family: inherit;
            box-shadow: 0 2px 6px rgba(217, 106, 119, 0.3);
            transition: all 0.15s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-dialog-confirm:hover {
            background: #C45A66;
            transform: translateY(-1px);
        }
    </style>
</asp:Content>

<asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <div class="archive-modal-page-wrapper">
        <div class="archive-dialog-card">

            <!-- Top Circular Badge with Archive Box Icon -->
            <div class="archive-icon-circle">
                <svg viewBox="0 0 24 24" fill="currentColor">
                    <!-- Lid -->
                    <path d="M3 6a1 1 0 0 1 1-1h16a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V6z" />
                    <!-- Box body with handle cutout -->
                    <path d="M4 10.5h16v7.5a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-7.5zm6 2.5a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2h-4z" />
                </svg>
            </div>

            <!-- Title -->
            <h2 class="archive-dialog-title">Archive Achievement?</h2>

            <!-- Message Body -->
            <p class="archive-dialog-desc">
                Are you sure you want to archive "<asp:Literal ID="litAchievementTitle" runat="server" Text="Master of Habits" />"?<br />
                This action can be undone later from the archive settings.
            </p>

            <!-- Action Buttons -->
            <div class="archive-actions-row">
                <asp:Button ID="btnCancel" runat="server" CssClass="btn-dialog-cancel" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                <asp:Button ID="btnConfirmArchive" runat="server" CssClass="btn-dialog-confirm" Text="Archive" OnClick="btnConfirmArchive_Click" />
            </div>

        </div>
    </div>
</asp:Content>
