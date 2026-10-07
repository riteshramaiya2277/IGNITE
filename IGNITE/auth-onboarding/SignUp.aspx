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
    <style>
      .field-validation-error {
        display: block;
        color: #ED595A;
        font-size: 12px;
        font-weight: 600;
        margin-top: 5px;
      }
    </style>
  </head>
  <body>
    <form id="form1" runat="server">
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
            <asp:TextBox
              id="fullName"
              runat="server"
              ClientIDMode="Static"
              autocomplete="name"
            ></asp:TextBox>
            <asp:RequiredFieldValidator
              ID="rfvFullName"
              runat="server"
              ControlToValidate="fullName"
              ErrorMessage="Your name is required."
              CssClass="field-validation-error"
              Display="Dynamic"
              ValidationGroup="SignUpGroup"
            />

            <label for="email">Email address</label>
            <asp:TextBox
              id="email"
              runat="server"
              ClientIDMode="Static"
              autocomplete="email"
            ></asp:TextBox>
            <asp:RequiredFieldValidator
              ID="rfvEmail"
              runat="server"
              ControlToValidate="email"
              ErrorMessage="Email address is required."
              CssClass="field-validation-error"
              Display="Dynamic"
              ValidationGroup="SignUpGroup"
            />
            <asp:RegularExpressionValidator
              ID="revEmail"
              runat="server"
              ControlToValidate="email"
              ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$"
              ErrorMessage="Please enter a valid email address."
              CssClass="field-validation-error"
              Display="Dynamic"
              ValidationGroup="SignUpGroup"
            />

            <label for="password">Create a password</label>
            <asp:TextBox
              id="password"
              runat="server"
              TextMode="Password"
              ClientIDMode="Static"
              autocomplete="new-password"
            ></asp:TextBox>
            <p class="field-hint">Use at least 8 characters.</p>
            <asp:RequiredFieldValidator
              ID="rfvPassword"
              runat="server"
              ControlToValidate="password"
              ErrorMessage="Password is required."
              CssClass="field-validation-error"
              Display="Dynamic"
              ValidationGroup="SignUpGroup"
            />
            <asp:RegularExpressionValidator
              ID="revPassword"
              runat="server"
              ControlToValidate="password"
              ValidationExpression=".{8,}"
              ErrorMessage="Your password must be at least 8 characters."
              CssClass="field-validation-error"
              Display="Dynamic"
              ValidationGroup="SignUpGroup"
            />

            <label for="confirmPassword">Confirm password</label>
            <asp:TextBox
              id="confirmPassword"
              runat="server"
              TextMode="Password"
              ClientIDMode="Static"
              autocomplete="new-password"
            ></asp:TextBox>
            <asp:RequiredFieldValidator
              ID="rfvConfirmPassword"
              runat="server"
              ControlToValidate="confirmPassword"
              ErrorMessage="Please confirm your password."
              CssClass="field-validation-error"
              Display="Dynamic"
              ValidationGroup="SignUpGroup"
            />
            <asp:CompareValidator
              ID="cmpPassword"
              runat="server"
              ControlToValidate="confirmPassword"
              ControlToCompare="password"
              ErrorMessage="The passwords do not match."
              CssClass="field-validation-error"
              Display="Dynamic"
              ValidationGroup="SignUpGroup"
            />

            <asp:Button
              ID="btnSignUp"
              runat="server"
              CssClass="button button-primary"
              Text="Create account"
              OnClick="btnSignUp_Click"
              ValidationGroup="SignUpGroup"
            />
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
