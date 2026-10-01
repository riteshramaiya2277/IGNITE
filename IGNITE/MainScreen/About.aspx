<%@ Page Language="C#" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#fff8ed" />
    <title>About IGNITE | Built for student momentum</title>
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
        <a href="About.aspx" aria-current="page">About Us</a>
      </nav>
      <div class="header-actions">
        <a class="login-link" href="Home.aspx#how-it-works">Login</a>
        <a class="button button-small" href="Home.aspx#preview">Get Started</a>
      </div>
    </header>

    <main>
      <section class="info-hero about-hero" aria-labelledby="about-title">
        <p class="eyebrow">
          <span aria-hidden="true">●</span> The idea behind IGNITE
        </p>
        <h1 id="about-title">Make progress<br /><span>feel possible.</span></h1>
        <p>
          Student life is full of big ambitions and small daily demands. IGNITE
          brings habits, assignments, and long-term goals into one motivating
          place.
        </p>
        <a class="button" href="Home.aspx#features">Explore what you can do</a>
      </section>

      <section class="about-story content-band" aria-labelledby="story-title">
        <div class="story-copy">
          <p class="section-kicker">Small actions. Real momentum.</p>
          <h2 id="story-title">
            A little structure can change a whole semester.
          </h2>
          <p>
            IGNITE is designed around a simple idea: meaningful progress comes
            from the things you do consistently. Plan the next task, keep a
            routine, and give every finished step the recognition it deserves.
          </p>
          <p>
            Instead of treating productivity as an endless checklist, IGNITE
            makes the journey visible with streaks, milestones, and experience
            points.
          </p>
        </div>
        <div class="story-statement">
          <span class="statement-mark" aria-hidden="true">✦</span>
          <p>
            Build your rhythm.<br /><strong>Celebrate the progress.</strong>
          </p>
          <span class="statement-rule"></span
          ><small>Habits · Focus · Growth</small>
        </div>
      </section>

      <section class="values-section" aria-labelledby="values-title">
        <div class="section-heading">
          <p class="section-kicker">What guides us</p>
          <h2 id="values-title">Built around how students grow</h2>
          <p>
            Practical tools, encouraging feedback, and room to find a routine
            that works for you.
          </p>
        </div>
        <div class="values-grid">
          <article class="value-item">
            <span class="feature-icon feature-coral" aria-hidden="true">✓</span>
            <h3>Progress over perfection</h3>
            <p>
              A missed day is a moment, not the whole story. Start again and
              keep moving.
            </p>
          </article>
          <article class="value-item">
            <span class="feature-icon feature-blue" aria-hidden="true">☷</span>
            <h3>Clarity over clutter</h3>
            <p>
              Keep priorities, habits, and goals together so the next step is
              easier to see.
            </p>
          </article>
          <article class="value-item">
            <span class="feature-icon feature-green" aria-hidden="true">◎</span>
            <h3>Motivation with meaning</h3>
            <p>
              Turn effort into visible milestones that make consistency
              satisfying.
            </p>
          </article>
        </div>
      </section>

      <section class="about-callout">
        <div>
          <p class="section-kicker">Your next chapter starts small</p>
          <h2>One focused step is a good place to begin.</h2>
        </div>
        <a class="button" href="Home.aspx#preview">See the IGNITE experience</a>
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
          <a href="Support.aspx">Help Center</a
          ><a href="Support.aspx#contact">Contact Us</a
          ><a href="Support.aspx#policies">Policies</a>
        </div>
      </div>
      <div class="footer-bottom">
        <p>© 2024 Ignite Productivity Inc. All rights reserved.</p>
        <nav aria-label="Legal links">
          <a href="Support.aspx#policies">Privacy</a
          ><a href="Support.aspx#policies">Cookies</a
          ><a href="Support.aspx#policies">Security</a>
        </nav>
      </div>
    </footer>
  </body>
</html>
