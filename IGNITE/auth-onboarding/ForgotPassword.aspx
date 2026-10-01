<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="ForgotPassword.aspx.cs"
Inherits="IGNITE.AuthOnboarding.ForgotPassword" %>
<!DOCTYPE html>
<html lang="en">
  <head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#fff8ed" />
    <title>Password help | IGNITE</title>
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
          <a class="brand" href="../MainScreen/Home.aspx"
            ><img src="../assets/L1 1.svg" alt="" /><span>IGNITE</span></a
          >
          <div class="aside-copy">
            <p class="eyebrow">A FRESH START</p>
            <h1 id="aside-title">
              Your progress<br /><span>is still yours.</span>
            </h1>
            <p>Get back to the routines and goals you have been building.</p>
          </div>
          <div class="aside-note">
            <span class="note-mark">↗</span><span>One step at a time.</span>
          </div>
        </section>
        <section class="auth-main" aria-labelledby="form-title">
          <div class="auth-form-wrap">
            <a class="mobile-brand" href="../MainScreen/Home.aspx"
              ><img src="../assets/L1 1.svg" alt="" /> IGNITE</a
            >
            <p class="eyebrow">ACCOUNT ACCESS</p>
            <h2 id="form-title">Need a hand signing in?</h2>
            <p class="form-intro">
              Enter your account email and we will help you find your way back.
            </p>
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
            <button
              class="button button-primary"
              type="submit"
              name="intent"
              value="recover"
            >
              Continue
            </button>
            <p class="form-switch"><a href="Login.aspx">Back to sign in</a></p>
            <p class="prototype-note">
              Password recovery will be available when persistent accounts and
              email delivery are connected.
            </p>
          </div>
        </section>
      </main>
    </form>
  </body>
</html>
