<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IGNITE.Admin.Login" %>

    <!DOCTYPE html>
    <html lang="en">

    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin Portal Sign In — IGNITE</title>

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap"
            rel="stylesheet" />

        <style>
            :root {
                --bg-app: #F6F4EE;
                --bg-card: #FFFFFF;
                --accent-rose: #DE6B7A;
                --accent-rose-hover: #D05C6C;
                --rose-light: #F8ECEE;
                --rose-border: #F0C4CB;
                --border-soft: #DDD6CB;
                --text-main: #18181B;
                --text-muted: #78716C;
                --radius-md: 12px;
                --radius-pill: 9999px;
                --font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                min-height: 100vh;
                background-color: var(--bg-app);
                color: var(--text-main);
                font-family: var(--font-family);
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 24px;
            }

            .admin-login-shell {
                width: 100%;
                max-width: 440px;
                background-color: var(--bg-card);
                border: 1px solid var(--border-soft);
                border-radius: 18px;
                padding: 38px 32px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
            }

            .brand-header {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 12px;
                margin-bottom: 24px;
            }

            .brand-icon {
                width: 32px;
                height: 32px;
                fill: #18181B;
            }

            .brand-title {
                font-size: 1.55rem;
                font-weight: 800;
                letter-spacing: -0.01em;
                color: #18181B;
            }

            .portal-badge {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                margin: 0 auto 20px auto;
                padding: 5px 12px;
                border-radius: var(--radius-pill);
                background-color: var(--rose-light);
                border: 1px solid var(--rose-border);
                font-size: 11px;
                font-weight: 700;
                letter-spacing: 0.08em;
                color: var(--accent-rose);
                text-transform: uppercase;
            }

            .badge-dot {
                width: 6px;
                height: 6px;
                border-radius: 50%;
                background-color: var(--accent-rose);
            }

            .login-title {
                font-size: 1.4rem;
                font-weight: 700;
                text-align: center;
                margin-bottom: 8px;
                color: var(--text-main);
            }

            .login-subtitle {
                font-size: 0.9rem;
                color: var(--text-muted);
                text-align: center;
                margin-bottom: 24px;
            }

            .status-alert {
                padding: 10px 14px;
                border-radius: 8px;
                font-size: 13.5px;
                margin-bottom: 18px;
                background-color: #FEF2F2;
                color: #B91C1C;
                border: 1px solid #FECACA;
                display: none;
            }

            .status-alert.visible {
                display: block;
            }

            .form-group {
                margin-bottom: 18px;
            }

            .form-label {
                display: block;
                font-size: 0.88rem;
                font-weight: 600;
                margin-bottom: 7px;
                color: #44403C;
            }

            .form-input {
                width: 100%;
                padding: 11px 14px;
                border: 1.5px solid var(--border-soft);
                border-radius: 10px;
                font-size: 0.95rem;
                font-family: inherit;
                color: var(--text-main);
                background-color: #FAFAFA;
                transition: border-color 150ms ease, box-shadow 150ms ease;
            }

            .form-input:focus {
                outline: none;
                border-color: var(--accent-rose);
                background-color: #FFFFFF;
                box-shadow: 0 0 0 3px rgba(222, 107, 122, 0.2);
            }

            .admin-submit-btn {
                width: 100%;
                padding: 12px;
                background-color: var(--accent-rose);
                color: #FFFFFF;
                border: none;
                border-radius: 10px;
                font-size: 0.98rem;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 150ms ease, transform 150ms ease;
                margin-top: 6px;
            }

            .admin-submit-btn:hover {
                background-color: var(--accent-rose-hover);
                transform: translateY(-1px);
            }

            .admin-submit-btn:active {
                transform: translateY(0);
            }

            .demo-box {
                margin-top: 24px;
                padding: 14px;
                background-color: var(--rose-light);
                border: 1.5px dashed var(--rose-border);
                border-radius: var(--radius-md);
                font-size: 13px;
            }

            .demo-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 8px;
                font-weight: 700;
                color: var(--accent-rose);
            }

            .demo-fill-btn {
                background-color: var(--accent-rose);
                color: #FFFFFF;
                border: none;
                border-radius: 6px;
                font-size: 11.5px;
                font-weight: 600;
                padding: 3px 10px;
                cursor: pointer;
            }

            .demo-row {
                display: flex;
                justify-content: space-between;
                color: #44403C;
                margin-top: 4px;
            }

            .back-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                font-size: 0.88rem;
                color: var(--text-muted);
                text-decoration: none;
            }

            .back-link:hover {
                color: var(--text-main);
                text-decoration: underline;
            }

            .field-validation-error {
                display: block;
                color: #DC2626;
                font-size: 0.8rem;
                font-weight: 600;
                margin-top: 5px;
            }
        </style>
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="admin-login-shell">
                <div class="brand-header">
                    <svg class="brand-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                    </svg>
                    <span class="brand-title">IGNITE</span>
                </div>

                <div style="text-align: center;">
                    <div class="portal-badge">
                        <span class="badge-dot"></span>
                        Administrative Portal
                    </div>
                </div>

                <h1 class="login-title">Admin Sign In</h1>
                <p class="login-subtitle">Authenticate to access the management workspace</p>

                <div id="pnlError" runat="server" class="status-alert">
                    <asp:Literal ID="litErrorMessage" runat="server"></asp:Literal>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtAdminId">Admin ID or Email</label>
                    <asp:TextBox ID="txtAdminId" runat="server" CssClass="form-input"
                        placeholder="admin@ignite.com or admin"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAdminId" runat="server"
                        ControlToValidate="txtAdminId"
                        ErrorMessage="Admin ID or Email is required."
                        CssClass="field-validation-error"
                        Display="Dynamic"
                        ValidationGroup="AdminLoginGroup" />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input"
                        placeholder="Enter password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        CssClass="field-validation-error"
                        Display="Dynamic"
                        ValidationGroup="AdminLoginGroup" />
                </div>

                <asp:Button ID="btnSubmit" runat="server" Text="Sign In to Admin Panel" CssClass="admin-submit-btn"
                    OnClick="btnSubmit_Click" ValidationGroup="AdminLoginGroup" />

                <div class="demo-box">
                    <div class="demo-header">
                        <span>Default Admin Credentials</span>
                        <button type="button" class="demo-fill-btn" onclick="fillAdminDefaults()">Quick Fill</button>
                    </div>
                    <div class="demo-row">
                        <span>ID:</span>
                        <strong>admin@ignite.com (or admin)</strong>
                    </div>
                    <div class="demo-row">
                        <span>Password:</span>
                        <strong>Admin@123</strong>
                    </div>
                </div>

                <a href="<%= ResolveUrl(" ~/auth-onboarding/Login.aspx") %>" class="back-link">
                    &larr; Return to Student Sign In
                </a>
            </div>
        </form>

        <script type="text/javascript">
            function fillAdminDefaults() {
                var idBox = document.getElementById('<%= txtAdminId.ClientID %>');
                var passBox = document.getElementById('<%= txtPassword.ClientID %>');
                if (idBox && passBox) {
                    idBox.value = 'admin@ignite.com';
                    passBox.value = 'Admin@123';
                    passBox.focus();
                }
            }
        </script>
    </body>

    </html>