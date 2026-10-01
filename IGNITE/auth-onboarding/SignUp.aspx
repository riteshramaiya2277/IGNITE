<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs"
Inherits="IGNITE.AuthOnboarding.SignUp" %>
<!DOCTYPE html>
<html lang="en">
  <head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#fff8ed" />
    <title>Create account | IGNITE</title>
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
            <p class="eyebrow">START WITH ONE SMALL WIN</p>
            <h1 id="aside-title">
              Make room for<br /><span>your best work.</span>
            </h1>
            <p>
              Set up your space, find your rhythm, and let the streaks add up.
            </p>
          </div>
          <div class="aside-note">
            <span class="note-mark">01</span
            ><span>Your goals, your pace, your semester.</span>
          </div>
        </section>
        <section class="auth-main" aria-labelledby="form-title">
          <div class="auth-form-wrap">
            <a class="mobile-brand" href="../MainScreen/Home.aspx"
              ><img src="../assets/L1 1.svg" alt="" /> IGNITE</a
            >
            <p class="eyebrow">CREATE YOUR ACCOUNT</p>
            <h2 id="form-title">Start your journey</h2>
            <p class="form-intro">
              A little structure can change your whole semester.
            </p>
            <p class="status-message" role="status" aria-live="polite">
              <%= Server.HtmlEncode(StatusMessage) %>
            </p>
            <label for="fullName">Your name</label>
            <input
              id="fullName"
              name="fullName"
              type="text"
              autocomplete="name"
              value="<%= Server.HtmlEncode(FullNameValue) %>"
            />
            <label for="email">Email address</label>
            <input
              id="email"
              name="email"
              type="text"
              autocomplete="email"
              value="<%= Server.HtmlEncode(EmailValue) %>"
            />
            <label for="password">Create a password</label>
            <input
              id="password"
              name="password"
              type="password"
              autocomplete="new-password"
            />
            <p class="field-hint">Use at least 8 characters.</p>
            <label for="confirmPassword">Confirm password</label>
            <input
              id="confirmPassword"
              name="confirmPassword"
              type="password"
              autocomplete="new-password"
            />
            <button
              class="button button-primary"
              type="submit"
              name="intent"
              value="signup"
            >
              Create account
            </button>
            <p class="form-switch">
              Already have an account? <a href="Login.aspx">Sign in</a>
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
