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
            <label for="email">Email address</label>
            <input
              id="email"
              name="email"
              type="text"
              autocomplete="email"
              value="<%= Server.HtmlEncode(EmailValue) %>"
            />
            <label for="password">Password</label>
            <input
              id="password"
              name="password"
              type="password"
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
