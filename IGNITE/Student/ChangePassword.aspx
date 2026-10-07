<%@ Page Title="Security & Password — IGNITE" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="IGNITE.Student.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/profile.css?v=2" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Preferences
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile-canvas">
        <!-- Back Navigation -->
        <div style="display: flex; align-items: center; margin-bottom: 6px;">
            <a href="Profile.aspx?mode=settings" class="btn-back-preferences">
                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.5">
                    <line x1="19" y1="12" x2="5" y2="12"></line>
                    <polyline points="12 19 5 12 12 5"></polyline>
                </svg>
                <span>Back to Preferences</span>
            </a>
        </div>

        <!-- Header -->
        <div class="profile-header">
            <h1 class="profile-title">Manage Preferences</h1>
            <p class="profile-subtitle">Adjust your account, appearance, and experience to fit your journey.</p>
        </div>

        <!-- Exact Security & Password Card from Figma Design -->
        <div class="security-password-panel">
            <h2 class="security-password-title">Security &amp; Password</h2>

            <div class="security-password-row">
                <!-- Current Password -->
                <div class="pref-field-group">
                    <label class="pref-field-label">Current Password</label>
                    <div class="password-input-wrapper">
                        <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="password-input-field" TextMode="Password" Text="password123" />
                        <button type="button" class="btn-toggle-eye" onclick="togglePasswordVisibility('<%= txtCurrentPassword.ClientID %>', this)">
                            <svg class="eye-open" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display: none;">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                            <svg class="eye-closed" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                                <line x1="1" y1="1" x2="23" y2="23"></line>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- New Password -->
                <div class="pref-field-group">
                    <label class="pref-field-label">New Password</label>
                    <div class="password-input-wrapper">
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="password-input-field" TextMode="Password" placeholder="Min 8 characters" />
                        <button type="button" class="btn-toggle-eye" onclick="togglePasswordVisibility('<%= txtNewPassword.ClientID %>', this)">
                            <svg class="eye-open" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                            <svg class="eye-closed" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display: none;">
                                <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                                <line x1="1" y1="1" x2="23" y2="23"></line>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- Confirm New -->
                <div class="pref-field-group">
                    <label class="pref-field-label">Confirm New</label>
                    <div class="password-input-wrapper">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="password-input-field" TextMode="Password" placeholder="" />
                        <button type="button" class="btn-toggle-eye" onclick="togglePasswordVisibility('<%= txtConfirmPassword.ClientID %>', this)">
                            <svg class="eye-open" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display: none;">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                            <svg class="eye-closed" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                                <line x1="1" y1="1" x2="23" y2="23"></line>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Action Button: Update Security -->
            <div class="security-password-actions">
                <asp:Button ID="btnUpdateSecurity" runat="server" CssClass="btn-update-security" Text="Update Security" OnClick="btnUpdateSecurity_Click" />
            </div>
        </div>
    </div>

    <!-- Toast Notification -->
    <div id="passwordToast" class="toast-notice">
        <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2.5">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="passwordToastMessage">Security preferences updated successfully!</span>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        // Toggle password show/hide
        function togglePasswordVisibility(fieldId, btnEl) {
            var field = document.getElementById(fieldId);
            if (!field) return;

            var eyeOpen = btnEl.querySelector('.eye-open');
            var eyeClosed = btnEl.querySelector('.eye-closed');

            if (field.type === 'password') {
                field.type = 'text';
                if (eyeOpen) eyeOpen.style.display = 'block';
                if (eyeClosed) eyeClosed.style.display = 'none';
            } else {
                field.type = 'password';
                if (eyeOpen) eyeOpen.style.display = 'none';
                if (eyeClosed) eyeClosed.style.display = 'block';
            }
        }

        function showToast(msg) {
            var toast = document.getElementById('passwordToast');
            var toastMsg = document.getElementById('passwordToastMessage');
            if (toast && toastMsg) {
                toastMsg.innerText = msg;
                toast.classList.add('show');
                setTimeout(function () {
                    toast.classList.remove('show');
                }, 3500);
            }
        }
    </script>
</asp:Content>
