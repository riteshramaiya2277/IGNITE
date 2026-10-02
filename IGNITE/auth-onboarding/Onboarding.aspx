<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Onboarding.aspx.cs"
    Inherits="IGNITE.AuthOnboarding.Onboarding" %>
    <!DOCTYPE html>
    <html lang="en">

    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="theme-color" content="#f4f1ec" />
        <title>Set up your IGNITE profile</title>
        <link href="../Content/auth-onboarding.css" rel="stylesheet" type="text/css" />
    </head>

    <body class="onboarding-page">
        <form id="form1" runat="server" method="post" novalidate>
            <main class="onboarding-shell">
                <section class="onboarding-card" aria-label="IGNITE onboarding">
                    <a class="onboarding-brand" href="../MainScreen/Home.aspx"><img src="../assets/L1 1.svg"
                            alt="" /><span>IGNITE</span></a>
                    <div class="wizard-progress" aria-live="polite">
                        <span id="step-label">STEP 1 OF 4</span><span id="step-percent">25% Complete</span>
                        <div class="wizard-track"><span id="step-progress"></span></div>
                    </div>
                    <p class="status-message" role="status" aria-live="polite">
                        <%= Server.HtmlEncode(StatusMessage) %>
                    </p>

                    <section class="wizard-step" data-step="1" aria-labelledby="profile-title">
                        <h1 id="profile-title">Let's set up your profile</h1>
                        <p class="wizard-intro">Tell us a bit about yourself to personalize your experience.</p>
                        <label class="photo-picker" for="profilePhoto"><span class="photo-placeholder"
                                id="photo-preview"><span aria-hidden="true">+</span></span><span>Upload profile photo
                                <small>Optional</small></span></label>
                        <input class="visually-hidden" id="profilePhoto" type="file" accept="image/*" />
                        <label class="wizard-label" for="fullName">Full Name</label>
                        <input class="wizard-input" id="fullName" name="fullName" type="text" autocomplete="name"
                            placeholder="Ritesh Ramaiya" value="<%= Server.HtmlEncode(FullNameValue == "Guest" ? string.Empty : FullNameValue) %>" />
                        <label class="wizard-label" for="academicMajor">Academic Major</label>
                        <select class="wizard-input" id="academicMajor" name="academicMajor">
                            <option value="">Select your major</option>
                            <option>Computer Science</option>
                            <option>Biology</option>
                            <option>Business</option>
                            <option>Engineering</option>
                            <option>Psychology</option>
                            <option>Other</option>
                        </select>
                    </section>

                    <section class="wizard-step" data-step="2" aria-labelledby="categories-title" hidden>
                        <h1 id="categories-title">What would you like to track?</h1>
                        <p class="wizard-intro">Select the categories that matter most to your student life.</p>
                        <div class="category-options">
                            <label class="category-option"><input type="checkbox" name="categories"
                                    value="Academic Excellence" /><span class="category-icon">✦</span><span
                                    class="category-copy"><strong>Academic Excellence</strong><small>Master your studies
                                        and boost your GPA.</small></span><span class="category-check"></span></label>
                            <label class="category-option"><input type="checkbox" name="categories"
                                    value="Physical Health" /><span class="category-icon">♥</span><span
                                    class="category-copy"><strong>Physical Health</strong><small>Build strength,
                                        stamina, and healthy eating habits.</small></span><span
                                    class="category-check"></span></label>
                            <label class="category-option"><input type="checkbox" name="categories"
                                    value="Mental Well-being" /><span class="category-icon">◐</span><span
                                    class="category-copy"><strong>Mental Well-being</strong><small>Reduce stress through
                                        mindfulness and meditation.</small></span><span
                                    class="category-check"></span></label>
                            <label class="category-option"><input type="checkbox" name="categories"
                                    value="Personal Growth" /><span class="category-icon">✿</span><span
                                    class="category-copy"><strong>Personal Growth</strong><small>Develop new skills and
                                        positive morning routines.</small></span><span
                                    class="category-check"></span></label>
                        </div>
                        <p class="wizard-footnote">You can always add more categories later in settings.</p>
                    </section>

                    <section class="wizard-step" data-step="3" aria-labelledby="habit-title" hidden>
                        <h1 id="habit-title">Create your first habit</h1>
                        <p class="wizard-intro">Start small to build long-term success. What's one thing you want to do
                            today?</p>
                        <label class="wizard-label" for="habitName">Habit Name</label>
                        <input class="wizard-input" id="habitName" name="habitName" type="text"
                            placeholder="e.g. Study for 1 hour" />
                        <div class="habit-suggestions"><button type="button" data-fill-habit="Drink 2L water">Drink 2L
                                water</button><button type="button" data-fill-habit="Morning Jog">Morning
                                Jog</button><button type="button" data-fill-habit="Read 10 pages">Read 10 pages</button>
                        </div>
                        <span class="wizard-label">How often?</span>
                        <div class="frequency-options" role="group" aria-label="Habit frequency">
                            <label><input type="radio" name="habitFrequency" value="Daily"
                                    checked /><span>◉<small>Daily</small></span></label>
                            <label><input type="radio" name="habitFrequency"
                                    value="Weekly" /><span>G<small>Weekly</small></span></label>
                            <label><input type="radio" name="habitFrequency"
                                    value="Custom" /><span>◆<small>Custom</small></span></label>
                        </div>
                        <label class="reminder-toggle"><span><strong>Daily Reminders</strong><small>Get a nudge when
                                    it's time to act.</small></span><input type="checkbox" name="habitReminders"
                                checked /><span class="toggle-track"></span></label>
                    </section>

                    <section class="wizard-step" data-step="4" aria-labelledby="goal-title" hidden>
                        <h1 id="goal-title">Set a <span class="accent-text">SMART</span> goal <small>(Optional)</small>
                        </h1>
                        <p class="wizard-intro">Define a clear target to stay motivated. SMART goals are Specific,
                            Measurable, Achievable, Relevant, and Time-bound.</p>
                        <label class="wizard-label" for="goalDescription">What do you want to achieve?</label>
                        <textarea class="wizard-input goal-textarea" id="goalDescription" name="goalDescription"
                            placeholder="e.g. Complete the Advanced Python Certification by finishing 2 modules every week."></textarea>
                        <div class="goal-fields"><label><span class="wizard-label">Target Deadline</span><input
                                    class="wizard-input" type="date" name="goalDeadline" /></label><span
                                class="estimate-chip"><small>ESTIMATED</small><strong>◷ &nbsp;30 Days</strong></span>
                        </div>
                        <aside class="quick-tip"><span aria-hidden="true">◷</span>
                            <p><strong>Quick Tip</strong><small>Students who set specific deadlines are 40% more likely
                                    to complete their goals.</small></p>
                        </aside>
                    </section>

                    <div class="wizard-actions"><button class="wizard-back" id="back-button" type="button"
                            hidden>Back</button><button class="wizard-next" id="next-button" type="button">Continue
                            <span aria-hidden="true">→</span></button><button class="wizard-next" id="finish-button"
                            type="submit" name="intent" value="finish" hidden>Go to Dashboard <span
                                aria-hidden="true">↗</span></button></div>
                    <p class="wizard-complete" id="wizard-complete" hidden>You've completed all onboarding steps!</p>
                </section>
            </main>
        </form>
        <script>
            (function () {
                var currentStep = 1;
                var steps = document.querySelectorAll(".wizard-step");
                var progress = document.getElementById("step-progress");
                var stepLabel = document.getElementById("step-label");
                var percent = document.getElementById("step-percent");
                var back = document.getElementById("back-button");
                var next = document.getElementById("next-button");
                var finish = document.getElementById("finish-button");
                var complete = document.getElementById("wizard-complete");

                function showStep(step) {
                    currentStep = step;
                    steps.forEach(function (panel) {
                        var active = Number(panel.getAttribute("data-step")) === step;
                        panel.hidden = !active;
                        panel.setAttribute("aria-hidden", active ? "false" : "true");
                    });
                    var value = step * 25;
                    progress.style.width = value + "%";
                    stepLabel.textContent = "STEP " + step + " OF 4";
                    percent.textContent = step === 4 ? "Almost there!" : value + "% Complete";
                    back.hidden = step === 1;
                    next.hidden = step === 4;
                    finish.hidden = step !== 4;
                    complete.hidden = step !== 4;
                }

                next.addEventListener("click", function () { showStep(Math.min(4, currentStep + 1)); });
                back.addEventListener("click", function () { showStep(Math.max(1, currentStep - 1)); });
                document.querySelectorAll("[data-fill-habit]").forEach(function (button) {
                    button.addEventListener("click", function () { document.getElementById("habitName").value = button.getAttribute("data-fill-habit"); });
                });
                document.getElementById("profilePhoto").addEventListener("change", function (event) {
                    var file = event.target.files && event.target.files[0];
                    if (!file) return;
                    var reader = new FileReader();
                    reader.onload = function () {
                        var preview = document.getElementById("photo-preview");
                        preview.style.backgroundImage = "url('" + reader.result + "')";
                        preview.classList.add("has-photo");
                    };
                    reader.readAsDataURL(file);
                });
            }());
        </script>
    </body>

    </html>