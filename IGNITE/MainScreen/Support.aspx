<%@ Page Language="C#" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#fff8ed" />
    <title>IGNITE Support | Help and answers</title>
    <link href="../Content/main-screen.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <header class="site-header">
      <a class="brand" href="Home.aspx" aria-label="IGNITE home"
        ><span class="brand-mark" aria-hidden="true">&#x1F525;</span
        ><span>IGNITE</span></a
      >
      <nav class="main-nav" aria-label="Main navigation">
        <a href="Home.aspx#features">Features</a>
        <a href="Home.aspx#how-it-works">How it Works</a>
        <a href="About.aspx">About Us</a>
      </nav>
      <div class="header-actions">
        <a class="login-link" href="../auth-onboarding/Login.aspx">Login</a>
        <a class="button button-small" href="../auth-onboarding/SignUp.aspx">Get Started</a>
      </div>
    </header>

    <main>
      <section class="info-hero support-hero" aria-labelledby="support-title">
        <p class="eyebrow">
          <span aria-hidden="true">●</span> IGNITE help center
        </p>
        <h1 id="support-title">
          A little help<br /><span>goes a long way.</span>
        </h1>
        <p>
          Find quick answers about habits, tasks, goals, and the way progress
          works in IGNITE.
        </p>
        <a class="button button-light" href="#common-questions"
          >Browse common questions</a
        >
      </section>

      <section class="support-topics" aria-label="Help topics">
        <a class="topic-link" href="#getting-started"
          ><span class="feature-icon feature-coral" aria-hidden="true">↗</span
          ><span
            ><strong>Getting started</strong
            ><small>Set up your study rhythm</small></span
          ></a
        >
        <a class="topic-link" href="#habits-and-tasks"
          ><span class="feature-icon feature-blue" aria-hidden="true">☷</span
          ><span
            ><strong>Habits and tasks</strong
            ><small>Keep daily work on track</small></span
          ></a
        >
        <a class="topic-link" href="#xp-and-streaks"
          ><span class="feature-icon feature-orange" aria-hidden="true">✦</span
          ><span
            ><strong>XP and streaks</strong
            ><small>Understand your progress</small></span
          ></a
        >
      </section>

      <section
        class="faq-section"
        id="common-questions"
        aria-labelledby="faq-title"
      >
        <div class="faq-intro">
          <p class="section-kicker">Quick answers</p>
          <h2 id="faq-title">Common questions</h2>
          <p>Helpful basics for building your routine with IGNITE.</p>
        </div>
        <div class="faq-list">
          <details class="faq-item" id="getting-started">
            <summary>How do I get started?</summary>
            <p>
              Choose one academic goal, break it into a few manageable tasks,
              then pick a small daily habit that supports it. You can adjust
              your plan as your semester changes.
            </p>
          </details>
          <details class="faq-item" id="habits-and-tasks">
            <summary>
              What is the difference between a habit and a task?
            </summary>
            <p>
              Habits are routines you want to repeat, like reading each evening.
              Tasks are individual pieces of work with a clear finish, like
              submitting an assignment.
            </p>
          </details>
          <details class="faq-item" id="xp-and-streaks">
            <summary>How do XP and streaks work?</summary>
            <p>
              XP recognizes completed actions, while a streak tracks consecutive
              days you maintain a chosen routine. They are there to make
              progress visible, not to punish a missed day.
            </p>
          </details>
          <details class="faq-item">
            <summary>Can I change a goal or routine later?</summary>
            <p>
              Yes. Your plans should fit your real workload. Update or replace a
              goal when your priorities change, and choose a routine you can
              reasonably maintain.
            </p>
          </details>
          <details class="faq-item">
            <summary>Does IGNITE connect to my school account?</summary>
            <p>
              No school-account connection is configured at this time. This site
              is currently a standalone experience and does not sync with school
              systems.
            </p>
          </details>
        </div>
      </section>

      <section
        class="support-contact"
        id="contact"
        aria-labelledby="contact-title"
      >
        <div class="contact-icon" aria-hidden="true">?</div>
        <div>
          <p class="section-kicker">Still looking?</p>
          <h2 id="contact-title">More support is on the way.</h2>
          <p>
            Direct support channels are not connected yet. For now, the answers
            above cover the available IGNITE experience.
          </p>
        </div>
        <a class="text-link" href="About.aspx"
          >Learn more about IGNITE <span aria-hidden="true">→</span></a
        >
      </section>

      <section
        class="policy-note"
        id="policies"
        aria-labelledby="policies-title"
      >
        <h2 id="policies-title">Privacy and policies</h2>
        <p>
          This demo does not submit support requests or connect to external
          services. Privacy, cookie, and security policy documents have not been
          published yet.
        </p>
      </section>
    </main>

    <footer class="site-footer">
      <div class="footer-main">
        <div class="footer-brand">
          <a class="brand" href="Home.aspx"
            ><span class="brand-mark" aria-hidden="true">&#x1F525;</span
            ><span>IGNITE</span></a
          >
          <p>
            The premium productivity platform built for the next generation of
            academic leaders.
          </p>
        </div>
        <div class="footer-links">
          <h2>Company</h2>
          <a href="About.aspx">About Us</a
          ><a href="About.aspx#values-title">Our Values</a
          ><a href="Home.aspx#features">Features</a>
        </div>
        <div class="footer-links">
          <h2>Support</h2>
          <a href="Support.aspx">Help Center</a><a href="#contact">Contact Us</a
          ><a href="#policies">Policies</a>
        </div>
      </div>
      <div class="footer-bottom">
        <p>© 2024 Ignite Productivity Inc. All rights reserved.</p>
        <nav aria-label="Legal links">
          <a href="#policies">Privacy</a><a href="#policies">Cookies</a
          ><a href="#policies">Security</a>
        </nav>
      </div>
    </footer>
  </body>
</html>
