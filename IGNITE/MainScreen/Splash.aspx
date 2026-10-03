<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>IGNITE</title>
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
            window.addEventListener('load', function () {
                var progressBar = document.getElementById('progressBar');
                var progressText = document.getElementById('progressText');
                if (progressBar) {
                    progressBar.style.transition = 'width 2.8s linear';
                    progressBar.style.width = '100%';
                }
                if (progressText) {
                    progressText.innerText = '100%';
                }
                window.setTimeout(function () {
                    window.location.replace('<%= ResolveUrl("~/MainScreen/Home.aspx") %>');
                }, 3000);
            });
        </script>
    </form>
</body>
</html>
