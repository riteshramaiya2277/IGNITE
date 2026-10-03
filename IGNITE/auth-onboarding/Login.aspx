<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs"
Inherits="IGNITE.AuthOnboarding.Login" %>
<!DOCTYPE html>
<html lang="en">
  <head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#fff8ed" />
    <title>Sign in | IGNITE</title>
    <link
      href="../Content/auth-onboarding.css"
      rel="stylesheet"
      type="text/css"
    />
  </head>
  <body>
    <form id="form1" runat="server" method="post" novalidate>
      <main class="auth-shell">
        <section class="auth-aside" aria-labelledby="aside-title">
          <a class="brand" href="../MainScreen/Home.aspx">
            <img src="../assets/L1 1.svg" alt="" />
            <span>IGNITE</span>
          </a>
          <div class="aside-copy">
            <p class="eyebrow">YOUR NEXT LEVEL STARTS HERE</p>
            <h1 id="aside-title">
              Small wins.<br /><span>Big momentum.</span>
            </h1>
            <p>
              Build the routines that make your academic goals feel within
              reach.
            </p>
          </div>
          <div class="aside-note">
            <span class="note-mark">✦</span
            ><span>Make progress visible, one day at a time.</span>
          </div>
        </section>
        <section class="auth-main" aria-labelledby="form-title">
          <div class="auth-form-wrap">
            <a class="mobile-brand" href="../MainScreen/Home.aspx"
              ><img src="../assets/L1 1.svg" alt="" /> IGNITE</a
            >
            <p class="eyebrow">WELCOME BACK</p>
            <h2 id="form-title">Sign in to IGNITE</h2>
            <p class="form-intro">Pick up where your progress left off.</p>
            <p class="status-message" role="status" aria-live="polite">
              <%= Server.HtmlEncode(StatusMessage) %>
            </p>
            <label for="email">Email address or Admin ID</label>
            <input
              id="email"
              name="email"
              type="text"
              autocomplete="email"
              placeholder="e.g. riteshramaiya2277@gmail.com or admin"
              value="<%= Server.HtmlEncode(EmailValue) %>"
            />
            <label for="password">Password</label>
            <input
              id="password"
              name="password"
              type="password"
              placeholder="Enter your password"
              autocomplete="current-password"
            />
            <div class="form-options">
              <a href="ForgotPassword.aspx">Forgot password?</a>
            </div>
            <button
              class="button button-primary"
              type="submit"
              name="intent"
              value="login"
            >
              Sign in
            </button>

            <!-- Quick Demo Credentials Helper Cards -->
            <div style="margin-top: 18px; display: flex; flex-direction: column; gap: 10px;">
              <!-- Student / User Account Card -->
              <div class="user-access-hint" style="padding: 12px 14px; background: #FFF9F5; border: 1.5px dashed #FF6B4A; border-radius: 10px; font-size: 13px; color: #4A4540;">
                <div style="font-weight: 700; color: #FF6B4A; margin-bottom: 6px; display: flex; align-items: center; justify-content: space-between;">
                  <span style="display:inline-flex; align-items:center; gap: 6px;">
                    <span style="width:7px; height:7px; border-radius:50%; background:#FF6B4A; display:inline-block;"></span>
                    Student / User Login
                  </span>
                  <button type="button" onclick="fillUserCreds()" style="background: #FF6B4A; color:#fff; border:none; border-radius: 6px; font-size: 11px; font-weight: 600; padding: 4px 10px; cursor: pointer;">Fill User</button>
                </div>
                <div style="display: flex; flex-direction: column; gap: 3px; font-size: 12.5px;">
                  <div>Email: <strong style="color: #18181B;">riteshramaiya2277@gmail.com</strong></div>
                  <div>Pass: <strong style="color: #18181B;">11111111</strong></div>
                </div>
              </div>

              <!-- Admin Credentials Helper Card -->
              <div class="admin-access-hint" style="padding: 12px 14px; background: #FAF7F2; border: 1.5px dashed #DE6B7A; border-radius: 10px; font-size: 13px; color: #4A4540;">
                <div style="font-weight: 700; color: #DE6B7A; margin-bottom: 6px; display: flex; align-items: center; justify-content: space-between;">
                  <span style="display:inline-flex; align-items:center; gap: 6px;">
                    <span style="width:7px; height:7px; border-radius:50%; background:#DE6B7A; display:inline-block;"></span>
                    Admin Panel Credentials
                  </span>
                  <button type="button" onclick="fillAdminCreds()" style="background: #DE6B7A; color:#fff; border:none; border-radius: 6px; font-size: 11px; font-weight: 600; padding: 4px 10px; cursor: pointer;">Fill Admin</button>
                </div>
                <div style="display: flex; flex-direction: column; gap: 3px; font-size: 12.5px;">
                  <div>ID: <strong style="color: #18181B;">admin@ignite.com</strong> <span style="font-size: 11px; color:#8C857D;">(or simply <strong>admin</strong>)</span></div>
                  <div>Pass: <strong style="color: #18181B;">Admin@123</strong></div>
                </div>
              </div>
            </div>

            <script type="text/javascript">
              function fillUserCreds() {
                var emailInput = document.getElementById('email');
                var passInput = document.getElementById('password');
                if (emailInput && passInput) {
                  emailInput.value = 'riteshramaiya2277@gmail.com';
                  passInput.value = '11111111';
                  passInput.focus();
                }
              }

              function fillAdminCreds() {
                var emailInput = document.getElementById('email');
                var passInput = document.getElementById('password');
                if (emailInput && passInput) {
                  emailInput.value = 'admin@ignite.com';
                  passInput.value = 'Admin@123';
                  passInput.focus();
                }
              }
            </script>

            <p class="form-switch">
              New to IGNITE? <a href="SignUp.aspx">Create an account</a>
            </p>
            <p class="prototype-note">
              Prototype accounts are kept only for this browser session.
            </p>
          </div>
        </section>
      </main>
    </form>
  </body>
</html>
