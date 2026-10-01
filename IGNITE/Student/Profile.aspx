<%@ Page Title="Manage Preferences — IGNITE" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="IGNITE.Student.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/profile.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile-canvas">
        <!-- 1. Header with Title & Subtitle -->
        <div class="profile-header">
            <h1 class="profile-title">Manage Preferences</h1>
            <p class="profile-subtitle">Adjust your account, appearance, and experience to fit your journey.</p>
        </div>

        <!-- 2. Profile Information Card -->
        <div class="pref-card">
            <h2 class="pref-card-title">Profile Information</h2>

            <div class="profile-info-grid">
                <!-- Top Row: Avatar + Full Name + Email Address -->
                <div class="profile-avatar-row">
                    <!-- Avatar Upload -->
                    <div class="avatar-upload-box">
                        <div class="avatar-circle" id="avatarDisplay">
                            <span id="avatarInitials">AM</span>
                        </div>
                        <label for="avatarUploadInput" class="avatar-camera-btn" title="Change Avatar Image">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                <path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
                                <circle cx="12" cy="13" r="4"></circle>
                            </svg>
                        </label>
                        <input type="file" id="avatarUploadInput" accept="image/*" style="display: none;" onchange="handleAvatarSelected(event)" />
                    </div>

                    <!-- Full Name -->
                    <div class="pref-field-group">
                        <label class="pref-field-label">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="pref-input" Text="Alex Mercer" placeholder="Enter your full name" />
                    </div>

                    <!-- Email Address -->
                    <div class="pref-field-group">
                        <label class="pref-field-label">Email Address</label>
                        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="pref-input" Text="alex.mercer@university.edu" TextMode="Email" placeholder="Enter your university email" />
                    </div>
                </div>

                <!-- Middle Row: College / Institution + Current Course -->
                <div class="pref-form-row">
                    <div class="pref-field-group">
                        <label class="pref-field-label">College / Institution</label>
                        <div class="pref-select-wrap">
                            <asp:DropDownList ID="ddlCollege" runat="server" CssClass="pref-select">
                                <asp:ListItem Text="Institute of Modern Science" Value="Institute of Modern Science" Selected="True" />
                                <asp:ListItem Text="Faculty of Engineering &amp; Technology" Value="Faculty of Engineering & Technology" />
                                <asp:ListItem Text="School of Humanities &amp; Social Arts" Value="School of Humanities & Social Arts" />
                                <asp:ListItem Text="College of Health Sciences" Value="College of Health Sciences" />
                            </asp:DropDownList>
                            <span class="pref-select-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                        </div>
                    </div>

                    <div class="pref-field-group">
                        <label class="pref-field-label">Current Course</label>
                        <div class="pref-select-wrap">
                            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="pref-select">
                                <asp:ListItem Text="B.Sc. Biology &amp; Chemistry" Value="B.Sc. Biology & Chemistry" Selected="True" />
                                <asp:ListItem Text="B.Sc. Computer Science" Value="B.Sc. Computer Science" />
                                <asp:ListItem Text="B.Eng. Mechanical Engineering" Value="B.Eng. Mechanical Engineering" />
                                <asp:ListItem Text="B.A. Cognitive Psychology" Value="B.A. Cognitive Psychology" />
                            </asp:DropDownList>
                            <span class="pref-select-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Bottom Row: Academic Year + Semester -->
                <div class="pref-form-row">
                    <div class="pref-field-group">
                        <label class="pref-field-label">Academic Year</label>
                        <div class="pref-select-wrap">
                            <asp:DropDownList ID="ddlAcademicYear" runat="server" CssClass="pref-select">
                                <asp:ListItem Text="Freshman (Year 1)" Value="Freshman (Year 1)" />
                                <asp:ListItem Text="Sophomore (Year 2)" Value="Sophomore (Year 2)" />
                                <asp:ListItem Text="Junior (Year 3)" Value="Junior (Year 3)" Selected="True" />
                                <asp:ListItem Text="Senior (Year 4)" Value="Senior (Year 4)" />
                            </asp:DropDownList>
                            <span class="pref-select-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                        </div>
                    </div>

                    <div class="pref-field-group">
                        <label class="pref-field-label">Semester</label>
                        <div class="pref-select-wrap">
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="pref-select">
                                <asp:ListItem Text="Fall 2024" Value="Fall 2024" Selected="True" />
                                <asp:ListItem Text="Spring 2025" Value="Spring 2025" />
                                <asp:ListItem Text="Summer 2025" Value="Summer 2025" />
                                <asp:ListItem Text="Winter 2025" Value="Winter 2025" />
                            </asp:DropDownList>
                            <span class="pref-select-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Form Action Buttons -->
                <div class="pref-actions-row">
                    <asp:Button ID="btnSaveProfile" runat="server" CssClass="btn-save-preferences" Text="Save Profile Changes" OnClick="btnSaveProfile_Click" />
                    <button type="button" class="btn-discard-preferences" onclick="discardChanges()">Discard</button>
                </div>
            </div>
        </div>

        <!-- 3. Password & Security Card -->
        <div class="security-card">
            <div class="security-info">
                <h3 class="security-title">Password &amp; Security</h3>
                <p class="security-subtitle">Last changed 3 months ago. We recommend regular updates.</p>
            </div>

            <div class="security-actions">
                <a href="ChangePassword.aspx" class="btn-change-password-link">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M21 2l-2 2m-1.5 1.5L14 9l-1.5-1.5L11 9l-1.5-1.5L8 9l-1.5-1.5L5 9l-3 3 7 7 3-3-1.5-1.5L12 13l1.5-1.5L15 13l1.5-1.5L18 13l1.5-1.5L21 10z"></path>
                    </svg>
                    <span>Change Password</span>
                </a>

                <asp:LinkButton ID="btnLogoutSecurity" runat="server" CssClass="btn-security-logout" OnClick="btnLogoutSecurity_Click" CausesValidation="false">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                    </svg>
                    <span>Logout</span>
                </asp:LinkButton>
            </div>
        </div>

        <!-- Inline Security & Password Card (Exact User Screenshot) -->
        <div id="inlineSecurityPanel" class="security-password-panel" style="display: none;">
            <h2 class="security-password-title">Security &amp; Password</h2>

            <div class="security-password-row">
                <div class="pref-field-group">
                    <label class="pref-field-label">Current Password</label>
                    <div class="password-input-wrapper">
                        <input type="password" id="inlineCurrentPass" class="password-input-field" value="password123" />
                        <button type="button" class="btn-toggle-eye" onclick="togglePassField('inlineCurrentPass', this)">
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

                <div class="pref-field-group">
                    <label class="pref-field-label">New Password</label>
                    <div class="password-input-wrapper">
                        <input type="password" id="inlineNewPass" class="password-input-field" placeholder="Min 8 characters" />
                        <button type="button" class="btn-toggle-eye" onclick="togglePassField('inlineNewPass', this)">
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

                <div class="pref-field-group">
                    <label class="pref-field-label">Confirm New</label>
                    <div class="password-input-wrapper">
                        <input type="password" id="inlineConfirmPass" class="password-input-field" placeholder="" />
                        <button type="button" class="btn-toggle-eye" onclick="togglePassField('inlineConfirmPass', this)">
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
            </div>

            <div class="security-password-actions">
                <button type="button" class="btn-update-security" onclick="submitInlinePasswordChange()">Update Security</button>
            </div>
        </div>

        <!-- 4. Danger Zone Card -->
        <div class="danger-zone-card">
            <div class="danger-zone-left">
                <div class="danger-icon-wrap">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                        <line x1="12" y1="9" x2="12" y2="13"></line>
                        <line x1="12" y1="17" x2="12.01" y2="17"></line>
                    </svg>
                </div>
                <div class="danger-content">
                    <h3 class="danger-title">Danger Zone</h3>
                    <p class="danger-desc">Deleting your account is permanent. All your streak data, quest progress, and journal entries will be lost forever.</p>
                </div>
            </div>

            <button type="button" class="btn-delete-account-outline" onclick="openDeleteAccountModal()">Delete My Account</button>
        </div>
    </div>

    <!-- 5. Modal: Change Password -->
    <div id="passwordModal" class="pref-modal-overlay" onclick="closeOnOverlay(event, 'passwordModal')">
        <div class="pref-modal-card">
            <div class="pref-modal-header">
                <h3 class="pref-modal-title">Change Password</h3>
                <button type="button" class="btn-pref-close-modal" onclick="closeModal('passwordModal')">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>
            <div class="pref-modal-body">
                <div class="pref-field-group">
                    <label class="pref-field-label">Current Password</label>
                    <input type="password" id="txtCurrentPassword" class="pref-input" placeholder="••••••••••••" />
                </div>
                <div class="pref-field-group">
                    <label class="pref-field-label">New Password</label>
                    <input type="password" id="txtNewPassword" class="pref-input" placeholder="At least 8 characters" />
                </div>
                <div class="pref-field-group">
                    <label class="pref-field-label">Confirm New Password</label>
                    <input type="password" id="txtConfirmPassword" class="pref-input" placeholder="Repeat new password" />
                </div>
            </div>
            <div class="pref-modal-footer">
                <button type="button" class="btn-discard-preferences" onclick="closeModal('passwordModal')">Cancel</button>
                <button type="button" class="btn-save-preferences" onclick="submitPasswordChange()">Update Password</button>
            </div>
        </div>
    </div>

    <!-- 6. Modal: Delete Account Confirmation -->
    <div id="deleteModal" class="pref-modal-overlay" onclick="closeOnOverlay(event, 'deleteModal')">
        <div class="pref-modal-card" style="border-color: #FCA5A5;">
            <div class="pref-modal-header">
                <h3 class="pref-modal-title" style="color: #DC2626;">Delete Account</h3>
                <button type="button" class="btn-pref-close-modal" onclick="closeModal('deleteModal')">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>
            <div class="pref-modal-body">
                <p style="font-size: 0.9rem; color: #4B5563; line-height: 1.5; margin: 0;">
                    Are you absolutely sure you want to delete your account? This action <strong>cannot be undone</strong>. Your study records, level progress, badges, and habits history will be permanently deleted.
                </p>
                <div class="pref-field-group" style="margin-top: 6px;">
                    <label class="pref-field-label">Type "DELETE" to confirm</label>
                    <input type="text" id="txtDeleteConfirm" class="pref-input" placeholder="DELETE" />
                </div>
            </div>
            <div class="pref-modal-footer">
                <button type="button" class="btn-discard-preferences" onclick="closeModal('deleteModal')">Cancel</button>
                <button type="button" class="btn-delete-account-outline" style="background-color: #EF4444; color: #FFFFFF;" onclick="confirmDeleteAccount()">Permanently Delete</button>
            </div>
        </div>
    </div>

    <!-- 7. Toast Notification -->
    <div id="profileToast" class="toast-notice">
        <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2.5">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="profileToastMessage">Profile preferences saved successfully!</span>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        // Keep initial form values for discard action
        var initialName = "";
        var initialEmail = "";

        document.addEventListener('DOMContentLoaded', function () {
            var nameInput = document.getElementById('<%= txtFullName.ClientID %>');
            var emailInput = document.getElementById('<%= txtEmailAddress.ClientID %>');
            if (nameInput) initialName = nameInput.value;
            if (emailInput) initialEmail = emailInput.value;
        });

        // Handle Avatar File Selection
        function handleAvatarSelected(event) {
            var file = event.target.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var display = document.getElementById('avatarDisplay');
                    if (display) {
                        display.innerHTML = '<img src="' + e.target.result + '" alt="Avatar" />';
                    }
                    showToast('Avatar image updated!');
                };
                reader.readAsDataURL(file);
            }
        }

        // Discard Changes
        function discardChanges() {
            var nameInput = document.getElementById('<%= txtFullName.ClientID %>');
            var emailInput = document.getElementById('<%= txtEmailAddress.ClientID %>');
            if (nameInput) nameInput.value = initialName;
            if (emailInput) emailInput.value = initialEmail;
            showToast('Changes discarded.');
        }

        // Modal Handlers
        function openChangePasswordModal() {
            document.getElementById('passwordModal').classList.add('active');
        }

        function openDeleteAccountModal() {
            document.getElementById('deleteModal').classList.add('active');
        }

        function closeModal(modalId) {
            var modal = document.getElementById(modalId);
            if (modal) modal.classList.remove('active');
        }

        function closeOnOverlay(event, modalId) {
            if (event.target.id === modalId) {
                closeModal(modalId);
            }
        }

        // Submit Password Change
        function submitPasswordChange() {
            var curr = document.getElementById('txtCurrentPassword').value;
            var newPass = document.getElementById('txtNewPassword').value;
            var conf = document.getElementById('txtConfirmPassword').value;

            if (!curr || !newPass || !conf) {
                alert('Please fill in all password fields.');
                return;
            }
            if (newPass.length < 8) {
                alert('New password must be at least 8 characters long.');
                return;
            }
            if (newPass !== conf) {
                alert('New passwords do not match.');
                return;
            }

            closeModal('passwordModal');
            showToast('🔐 Password updated successfully!');
            document.getElementById('txtCurrentPassword').value = '';
            document.getElementById('txtNewPassword').value = '';
            document.getElementById('txtConfirmPassword').value = '';
        }

        // Toggle Password Visibility in inline panel
        function togglePassField(fieldId, btnEl) {
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

        function submitInlinePasswordChange() {
            var curr = document.getElementById('inlineCurrentPass').value;
            var newPass = document.getElementById('inlineNewPass').value;
            var conf = document.getElementById('inlineConfirmPass').value;

            if (!curr) {
                alert('Please enter your current password.');
                return;
            }
            if (!newPass || newPass.length < 8) {
                alert('New password must be at least 8 characters long.');
                return;
            }
            if (newPass !== conf) {
                alert('New passwords do not match.');
                return;
            }

            showToast('🔐 Security preferences and password updated successfully!');
            document.getElementById('inlineNewPass').value = '';
            document.getElementById('inlineConfirmPass').value = '';
        }

        // Confirm Delete Account
        function confirmDeleteAccount() {
            var confirmTxt = document.getElementById('txtDeleteConfirm').value;
            if (confirmTxt.trim().toUpperCase() !== 'DELETE') {
                alert('Please type DELETE to confirm account removal.');
                return;
            }
            closeModal('deleteModal');
            alert('Your account deletion request has been submitted.');
            window.location.href = '<%= ResolveUrl("~/Student/Dashboard.aspx") %>';
        }

        // Toast feedback
        function showToast(msg) {
            var toast = document.getElementById('profileToast');
            var toastMsg = document.getElementById('profileToastMessage');
            if (toast && toastMsg) {
                toastMsg.innerText = msg;
                toast.classList.add('show');
                setTimeout(function () {
                    toast.classList.remove('show');
                }, 3500);
            }
        }

        // Auto-show inline security panel if requested via query string or hash
        document.addEventListener('DOMContentLoaded', function () {
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('section') === 'security' || window.location.hash === '#security') {
                var secPanel = document.getElementById('inlineSecurityPanel');
                if (secPanel) {
                    secPanel.style.display = 'flex';
                    secPanel.scrollIntoView({ behavior: 'smooth' });
                }
            }
        });
    </script>
</asp:Content>
