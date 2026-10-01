<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Splash.aspx.cs" Inherits="IGNITE.MainScreen.Splash" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>IGNITE - Splash Screen</title>

    <!-- Google Fonts: Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />

    <link href="<%= ResolveUrl("~/Content/splash-screen.css") %>" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="splash-container">
            <!-- Logo Section -->
            <div class="splash-logo-section">
                <img src="<%= ResolveUrl("~/assets/L1 1.svg") %>" alt="IGNITE Logo" class="splash-logo-img" />
            </div>

            <!-- App Name -->
            <h1 class="splash-app-name">IGNITE</h1>

            <!-- Tagline -->
            <p class="splash-tagline">Building better habits, together.</p>

            <!-- Progress Section -->
            <div class="splash-progress-section">
                <div class="progress-label">INITIALIZING QUEST</div>
                <div class="progress-track">
                    <div class="progress-fill" id="progressBar" style="width: 0%;"></div>
                </div>
                <div class="progress-percentage" id="progressText">0%</div>
            </div>
        </div>

        <script type="text/javascript">
            // Animate progress bar
            var progress = 0;
            var targetProgress = 75;
            var progressBar = document.getElementById('progressBar');
            var progressText = document.getElementById('progressText');

            function animateProgress() {
                if (progress < targetProgress) {
                    progress++;
                    progressBar.style.width = progress + '%';
                    progressText.innerText = progress + '%';
                    setTimeout(animateProgress, 30);
                }
            }

            // Start animation when page loads
            window.onload = function() {
                setTimeout(animateProgress, 500);
            };
        </script>
    </form>
</body>
</html>
