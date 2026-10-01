<%@ Page Language="C#" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#fff8ed" />
    <title>IGNITE | Build habits. Reach your goals.</title>
    <link href="../Content/main-screen.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <header class="site-header">
      <a class="brand" href="#top" aria-label="IGNITE home"
        ><span class="brand-mark" aria-hidden="true">&#x1F525;</span
        ><span>IGNITE</span></a
      >
      <nav class="main-nav" aria-label="Main navigation">
        <a href="#features">Features</a>
        <a href="#how-it-works">How it Works</a>
        <a href="About.aspx">About Us</a>
      </nav>
      <div class="header-actions">
        <a class="login-link" href="../auth-onboarding/Login.aspx">Login</a>
        <a class="button button-small" href="../auth-onboarding/SignUp.aspx">Get Started</a>
      </div>
    </header>

    <main id="top">
      <section class="hero" aria-labelledby="hero-title">
        <div class="hero-copy">
          <p class="eyebrow">
            <span aria-hidden="true">●</span> Level up your productivity
          </p>
          <h1 id="hero-title">
            Master Your Habits,<br /><span>Ace Your Academic Goals.</span>
          </h1>
          <p class="hero-description">
            The gamified habit tracker designed specifically for students. Build
            study streaks, manage assignments, and earn XP as you dominate your
            semester.
          </p>
          <div class="hero-actions">
            <a class="button" href="../auth-onboarding/SignUp.aspx">Get Started Free</a>
            <a class="button button-light" href="#how-it-works">View Demo</a>
          </div>
        </div>
      </section>

      <section
        class="preview"
        id="preview"
        aria-label="IGNITE dashboard preview"
      >
        <div class="preview-column">
          <article class="panel task-panel">
            <div class="panel-heading">
              <h2>Today's Tasks</h2>
              <span class="tiny-label">3 remaining</span>
            </div>
            <div class="task-row">
              <span class="checkbox" aria-hidden="true"></span>
              <div>
                <strong>CS101 Algorithm Assignment</strong
                ><small>Due in 4 hours · Computer Science</small>
              </div>
            </div>
            <div class="task-row task-done">
              <span class="checkbox checked" aria-hidden="true">✓</span>
              <div>
                <strong>Return Library Books</strong
                ><small>Completed at 9:30 AM</small>
              </div>
            </div>
          </article>
          <article class="panel level-panel">
            <div class="level-top">
              <span class="icon-chip coral-chip" aria-hidden="true">✦</span>
              <div>
                <strong>Level 12 Scholar</strong><small>4,500 / 6,000 XP</small>
              </div>
            </div>
            <div class="meter"><span class="meter-coral"></span></div>
            <p class="next-level">1,500 XP to next level</p>
          </article>
        </div>

        <article class="challenge-panel">
          <p class="challenge-label">
            <span aria-hidden="true">●</span> Active challenge
          </p>
          <h2>30-Day Study Streak</h2>
          <p>
            Maintain a minimum of 4 hours of deep focus study every day for 30
            days straight.
          </p>
          <div class="challenge-progress">
            <div><span>Progress</span><strong>14/30 Days</strong></div>
            <div class="meter"><span class="meter-orange"></span></div>
          </div>
          <div class="reward">
            <span class="reward-icon" aria-hidden="true">✦</span
            ><strong>+500 XP Reward</strong>
          </div>
        </article>

        <div class="preview-column">
          <article class="panel habits-panel">
            <div class="panel-heading">
              <h2>Daily Habits</h2>
              <span class="status-dots" aria-label="2 habits remaining"
                >● ●</span
              >
            </div>
            <div class="habit-grid">
              <div class="habit-item">
                <span class="habit-icon blue-icon" aria-hidden="true">♨</span
                ><strong>Hydrate</strong>
              </div>
              <div class="habit-item">
                <span class="habit-icon slate-icon" aria-hidden="true">✓</span
                ><strong>Yoga</strong>
              </div>
              <div class="habit-item">
                <span class="habit-icon orange-icon" aria-hidden="true">▮</span
                ><strong>Reading</strong>
              </div>
              <div class="habit-item">
                <span class="habit-icon violet-icon" aria-hidden="true">◔</span
                ><strong>8h Sleep</strong>
              </div>
            </div>
          </article>
          <article class="panel goal-panel">
            <h2>Long-term Goal</h2>
            <div class="goal-row">
              <span class="goal-ring">80%</span>
              <div>
                <strong>Complete Thesis</strong
                ><small>12 of 15 sections finished</small>
              </div>
            </div>
          </article>
        </div>
      </section>

      <section
        class="features-section"
        id="features"
        aria-labelledby="features-title"
      >
        <div class="section-heading">
          <h2 id="features-title">Everything You Need to Succeed</h2>
          <p>
            IGNITE combines powerful organization tools with addictive
            gamification to keep you focused on what matters.
          </p>
        </div>
        <div class="feature-grid">
          <article class="feature-item">
            <span class="feature-icon feature-coral" aria-hidden="true">✓</span>
            <h3>Smart Habits</h3>
            <p>
              Build consistent routines for studying, health, and mindfulness.
              Track your progress with daily check-ins.
            </p>
          </article>
          <article class="feature-item">
            <span class="feature-icon feature-blue" aria-hidden="true">☷</span>
            <h3>Task Management</h3>
            <p>
              Organize assignments and projects by priority and subject. Never
              miss a deadline with automated reminders.
            </p>
          </article>
          <article class="feature-item">
            <span class="feature-icon feature-green" aria-hidden="true">◎</span>
            <h3>Goal Setting</h3>
            <p>
              Break down long-term academic ambitions into manageable
              milestones. Visualize your journey to the finish line.
            </p>
          </article>
          <article class="feature-item">
            <span class="feature-icon feature-orange" aria-hidden="true"
              >♜</span
            >
            <h3>Epic Challenges</h3>
            <p>
              Join community study sprints and discipline marathons. Push your
              limits and earn massive bonus rewards.
            </p>
          </article>
          <article class="feature-item">
            <span class="feature-icon feature-violet" aria-hidden="true"
              >ϟ</span
            >
            <h3>XP &amp; Leveling</h3>
            <p>
              Every positive action earns you experience points. Level up your
              avatar and unlock prestige badges as you grow.
            </p>
          </article>
          <article class="feature-item">
            <span class="feature-icon feature-purple" aria-hidden="true"
              >⌁</span
            >
            <h3>Insights</h3>
            <p>
              Understand your peak performance times and productivity blockers
              with detailed behavioral analysis.
            </p>
          </article>
        </div>
      </section>

      <section
        class="steps-section"
        id="how-it-works"
        aria-labelledby="steps-title"
      >
        <div class="section-heading">
          <h2 id="steps-title">Three Steps to Mastery</h2>
          <p>
            How IGNITE transforms your daily grind into a rewarding adventure.
          </p>
        </div>
        <ol class="steps-list">
          <li>
            <span class="step-number">1</span>
            <h3>Set Your Goals</h3>
            <p>Define what success looks like for your semester.</p>
          </li>
          <li>
            <span class="step-number">2</span>
            <h3>Track Daily Habits</h3>
            <p>Consistency is key. Log your wins every day.</p>
          </li>
          <li>
            <span class="step-number step-active">3</span>
            <h3>Level Up</h3>
            <p>Earn XP, unlock rewards, and watch your GPA soar.</p>
          </li>
        </ol>
      </section>

      <section
        class="motivation-section"
        id="about"
        aria-labelledby="motivation-title"
      >
        <div class="motivation-copy">
          <h2 id="motivation-title">
            Gamified Motivation<br />For High Achievers
          </h2>
          <article class="motivation-point">
            <span class="point-icon point-fire" aria-hidden="true">♨</span>
            <div>
              <h3>Loss Aversion via Streaks</h3>
              <p>
                Don't break the chain! Our streak system triggers healthy
                psychological commitment to your daily routines.
              </p>
            </div>
          </article>
          <article class="motivation-point">
            <span class="point-icon point-star" aria-hidden="true">★</span>
            <div>
              <h3>Positive Reinforcement</h3>
              <p>
                Turn boring studying into rewarding progress. Earning XP
                provides immediate dopamine hits for long-term efforts.
              </p>
            </div>
          </article>
          <article class="motivation-point">
            <span class="point-icon point-shield" aria-hidden="true">⬟</span>
            <div>
              <h3>Academic Prestige</h3>
              <p>
                Your “Level 15 Scholar” status isn't just a number. It's a
                testament to the discipline you've built over weeks.
              </p>
            </div>
          </article>
        </div>
        <div
          class="achievement-stack"
          aria-label="Example achievement notifications"
        >
          <div class="achievement achievement-top">
            <span class="avatar-dot" aria-hidden="true">S</span>
            <div>
              <small>New milestone!</small><strong>14 Day Streak! 🔥</strong>
            </div>
          </div>
          <div class="achievement">
            <span class="achievement-icon blue-icon" aria-hidden="true">✦</span>
            <div>
              <small>Achievement unlocked</small
              ><strong>Midnight Oil Master</strong>
            </div>
          </div>
          <div class="achievement">
            <span class="achievement-icon green-icon" aria-hidden="true"
              >✓</span
            >
            <div>
              <small>Reward received</small><strong>+1,200 XP Gained</strong>
            </div>
          </div>
        </div>
      </section>
    </main>

    <footer class="site-footer">
      <div class="footer-main">
        <div class="footer-brand">
          <a class="brand" href="#top"
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
          <a href="About.aspx">About Us</a><a href="About.aspx#values-title">Our Values</a
          ><a href="#features">Features</a><a href="#how-it-works">How it Works</a>
        </div>
        <div class="footer-links">
          <h2>Support</h2>
          <a href="Support.aspx">Help Center</a
          ><a href="Support.aspx#contact">Contact Us</a
          ><a href="Support.aspx#policies">Privacy Policy</a
          ><a href="Support.aspx#policies">Terms</a>
        </div>
      </div>
      <div class="footer-bottom">
        <p>© 2024 Ignite Productivity Inc. All rights reserved.</p>
        <nav aria-label="Legal links">
          <a href="Support.aspx#policies">Privacy</a><a href="Support.aspx#policies">Cookies</a
          ><a href="Support.aspx#policies">Security</a>
        </nav>
      </div>
    </footer>
  </body>
</html>
