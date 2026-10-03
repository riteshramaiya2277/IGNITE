# Database Implementation Plan — IGNITE

> **Purpose:** Step-by-step guide to create the SQL Server database and connect ASP.NET Web Forms pages to it.
>
> **Based on:** Plan.md sections 8-11, 34, and 38 (Phase 1)

---

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Database Setup](#2-database-setup)
3. [Database Creation](#3-database-creation)
4. [Table Creation](#4-table-creation)
5. [Stored Procedures](#5-stored-procedures)
6. [Web.config Configuration](#6-webconfig-configuration)
7. [Helper Classes](#7-helper-classes)
8. [Connecting Pages to Database](#8-connecting-pages-to-database)
9. [Testing Database Connection](#9-testing-database-connection)
10. [Security Checklist](#10-security-checklist)

---

## 1. Prerequisites

Before starting, ensure you have:

- [ ] Visual Studio installed (latest available in your environment)
- [ ] SQL Server installed (SQL Server Express or full version)
- [ ] SQL Server Management Studio (SSMS) or SQL Server Object Explorer in Visual Studio
- [ ] ASP.NET Web Forms project created (IGNITE project)
- [ ] Administrator access to create databases

---

## 2. Database Setup

### Option A: Using SQL Server Management Studio (SSMS)

1. Open SSMS and connect to your SQL Server instance
2. Right-click on "Databases" → "New Database"
3. Name it: `IGNITEDB`
4. Click OK

### Option B: Using Visual Studio SQL Server Object Explorer

1. In Visual Studio, go to View → SQL Server Object Explorer
2. Right-click on your SQL Server instance → "New Database"
3. Name it: `IGNITEDB`
4. Click OK

### Option C: Using T-SQL Script

```sql
CREATE DATABASE IGNITEDB;
GO

USE IGNITEDB;
GO
```

---

## 3. Database Creation

Run this script to create the database (if not already created):

```sql
-- Create IGNITEDB database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'IGNITEDB')
BEGIN
    CREATE DATABASE IGNITEDB;
END
GO

USE IGNITEDB;
GO
```

---

## 4. Table Creation

Create all 18 core tables in the correct order (respecting foreign key dependencies).

### 4.1 Categories Table

```sql
CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    Icon NVARCHAR(100),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO
```

### 4.2 Users Table

```sql
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(256) NOT NULL,
    Role NVARCHAR(20) NOT NULL CHECK (Role IN ('Student', 'Management')),
    College NVARCHAR(100),
    Course NVARCHAR(100),
    Year INT,
    Semester INT,
    AcademicGoals NVARCHAR(MAX),
    TotalXP INT DEFAULT 0,
    CurrentLevelId INT,
    CurrentTitleId INT,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO
```

### 4.3 Levels Table

```sql
CREATE TABLE Levels (
    LevelId INT PRIMARY KEY IDENTITY(1,1),
    LevelNumber INT UNIQUE NOT NULL,
    RequiredXP INT NOT NULL,
    Title NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO
```

### 4.4 Titles Table

```sql
CREATE TABLE Titles (
    TitleId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    MinLevel INT NOT NULL,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO
```

### 4.5 Habits Table

```sql
CREATE TABLE Habits (
    HabitId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    CategoryId INT,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    HabitType NVARCHAR(20) NOT NULL CHECK (HabitType IN ('Binary', 'Measurable')),
    Frequency NVARCHAR(20) NOT NULL CHECK (Frequency IN ('Daily', 'SelectedDays', 'Weekly', 'Custom')),
    ScheduledDays NVARCHAR(50), -- e.g., "Mon,Wed,Fri"
    TargetValue DECIMAL(10,2), -- for measurable habits
    Unit NVARCHAR(20), -- e.g., "hours", "pages"
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Active', 'Paused', 'Archived')),
    CurrentStreak INT DEFAULT 0,
    BestStreak INT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);
GO
```

### 4.6 HabitLogs Table

```sql
CREATE TABLE HabitLogs (
    HabitLogId INT PRIMARY KEY IDENTITY(1,1),
    HabitId INT NOT NULL,
    UserId INT NOT NULL,
    LogDate DATE NOT NULL,
    IsCompleted BIT DEFAULT 0,
    ActualValue DECIMAL(10,2), -- for measurable habits
    ProgressPercentage DECIMAL(5,2),
    XPEarned INT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (HabitId) REFERENCES Habits(HabitId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    UNIQUE (HabitId, LogDate) -- One log per habit per day
);
GO
```

### 4.7 Tasks Table

```sql
CREATE TABLE Tasks (
    TaskId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    GoalId INT,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    DueDate DATETIME,
    Priority NVARCHAR(20) NOT NULL CHECK (Priority IN ('Low', 'Medium', 'High')),
    CategoryId INT,
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'InProgress', 'Completed', 'Overdue')),
    XPReward INT DEFAULT 10,
    CompletedAt DATETIME,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (GoalId) REFERENCES Goals(GoalId),
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);
GO
```

### 4.8 Goals Table

```sql
CREATE TABLE Goals (
    GoalId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    Specific NVARCHAR(MAX),
    Measurable NVARCHAR(MAX),
    Achievable NVARCHAR(MAX),
    Relevant NVARCHAR(MAX),
    TimeBound NVARCHAR(MAX),
    TargetValue DECIMAL(10,2),
    CurrentValue DECIMAL(10,2) DEFAULT 0,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('InProgress', 'Completed', 'Paused')),
    XPReward INT DEFAULT 50,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO
```

### 4.9 GoalMilestones Table

```sql
CREATE TABLE GoalMilestones (
    MilestoneId INT PRIMARY KEY IDENTITY(1,1),
    GoalId INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    TargetValue DECIMAL(10,2),
    CurrentValue DECIMAL(10,2) DEFAULT 0,
    DueDate DATETIME,
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'Completed')),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (GoalId) REFERENCES Goals(GoalId)
);
GO
```

### 4.10 Challenges Table

```sql
CREATE TABLE Challenges (
    ChallengeId INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    CategoryId INT,
    Difficulty NVARCHAR(20) NOT NULL CHECK (Difficulty IN ('Easy', 'Medium', 'Hard')),
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    RequirementType NVARCHAR(50) NOT NULL, -- e.g., "HabitBased", "CountBased", "TargetBased"
    RequirementValue NVARCHAR(100),
    XPReward INT NOT NULL,
    AchievementId INT,
    IsPublished BIT DEFAULT 0,
    IsActive BIT DEFAULT 1,
    CreatedBy INT, -- Management user who created it
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId),
    FOREIGN KEY (AchievementId) REFERENCES Achievements(AchievementId),
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserId)
);
GO
```

### 4.11 ChallengeParticipants Table

```sql
CREATE TABLE ChallengeParticipants (
    ParticipantId INT PRIMARY KEY IDENTITY(1,1),
    ChallengeId INT NOT NULL,
    UserId INT NOT NULL,
    JoinDate DATETIME DEFAULT GETDATE(),
    CurrentProgress DECIMAL(10,2) DEFAULT 0,
    IsCompleted BIT DEFAULT 0,
    CompletedAt DATETIME,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ChallengeId) REFERENCES Challenges(ChallengeId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    UNIQUE (ChallengeId, UserId) -- One entry per user per challenge
);
GO
```

### 4.12 Quests Table

```sql
CREATE TABLE Quests (
    QuestId INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    QuestType NVARCHAR(20) NOT NULL CHECK (QuestType IN ('Automatic', 'Management')),
    RequirementType NVARCHAR(50) NOT NULL,
    RequirementValue NVARCHAR(100),
    XPReward INT NOT NULL,
    StartDate DATETIME,
    EndDate DATETIME,
    IsPublished BIT DEFAULT 0,
    IsActive BIT DEFAULT 1,
    CreatedBy INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserId)
);
GO
```

### 4.13 QuestProgress Table

```sql
CREATE TABLE QuestProgress (
    QuestProgressId INT PRIMARY KEY IDENTITY(1,1),
    QuestId INT NOT NULL,
    UserId INT NOT NULL,
    CurrentProgress DECIMAL(10,2) DEFAULT 0,
    IsCompleted BIT DEFAULT 0,
    CompletedAt DATETIME,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (QuestId) REFERENCES Quests(QuestId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    UNIQUE (QuestId, UserId)
);
GO
```

### 4.14 Achievements Table

```sql
CREATE TABLE Achievements (
    AchievementId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    Icon NVARCHAR(100),
    RequirementType NVARCHAR(50) NOT NULL,
    RequirementValue NVARCHAR(100),
    XPReward INT DEFAULT 0,
    IsHidden BIT DEFAULT 0,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO
```

### 4.15 UserAchievements Table

```sql
CREATE TABLE UserAchievements (
    UserAchievementId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    AchievementId INT NOT NULL,
    UnlockedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (AchievementId) REFERENCES Achievements(AchievementId),
    UNIQUE (UserId, AchievementId) -- Prevent duplicate unlocks
);
GO
```

### 4.16 XPTransactions Table

```sql
CREATE TABLE XPTransactions (
    TransactionId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    Amount INT NOT NULL,
    SourceType NVARCHAR(50) NOT NULL, -- e.g., "Habit", "Task", "Challenge", "Quest"
    SourceId INT,
    Description NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO
```

### 4.17 JournalEntries Table

```sql
CREATE TABLE JournalEntries (
    JournalId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    Title NVARCHAR(100),
    Content NVARCHAR(MAX) NOT NULL,
    Mood NVARCHAR(20),
    Tags NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO
```

### 4.18 Notes Table

```sql
CREATE TABLE Notes (
    NoteId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    Title NVARCHAR(100),
    Content NVARCHAR(MAX) NOT NULL,
    Category NVARCHAR(50),
    IsPinned BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO
```

### 4.19 Notifications Table

```sql
CREATE TABLE Notifications (
    NotificationId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    Type NVARCHAR(50) NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    Message NVARCHAR(MAX) NOT NULL,
    RelatedEntityId INT,
    IsRead BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO
```

### 4.20 Add Indexes for Performance

```sql
-- Index for user-related queries
CREATE INDEX IX_Habits_UserId ON Habits(UserId);
CREATE INDEX IX_HabitLogs_UserId ON HabitLogs(UserId);
CREATE INDEX IX_Tasks_UserId ON Tasks(UserId);
CREATE INDEX IX_Goals_UserId ON Goals(UserId);
CREATE INDEX IX_ChallengeParticipants_UserId ON ChallengeParticipants(UserId);
CREATE INDEX IX_QuestProgress_UserId ON QuestProgress(UserId);
CREATE INDEX IX_XPTransactions_UserId ON XPTransactions(UserId);
CREATE INDEX IX_JournalEntries_UserId ON JournalEntries(UserId);
CREATE INDEX IX_Notes_UserId ON Notes(UserId);
CREATE INDEX IX_Notifications_UserId ON Notifications(UserId);

-- Index for status and date queries
CREATE INDEX IX_Tasks_Status_DueDate ON Tasks(Status, DueDate);
CREATE INDEX IX_HabitLogs_LogDate ON HabitLogs(LogDate);
CREATE INDEX IX_Challenges_Dates ON Challenges(StartDate, EndDate);
CREATE INDEX IX_Quests_Dates ON Quests(StartDate, EndDate);
GO
```

---

## 5. Stored Procedures

Create initial stored procedures following the naming convention from Plan.md Section 11.

### 5.1 User Authentication Procedures

#### sp_User_Register

```sql
CREATE PROCEDURE sp_User_Register
    @FullName NVARCHAR(100),
    @Email NVARCHAR(100),
    @PasswordHash NVARCHAR(256),
    @Role NVARCHAR(20),
    @College NVARCHAR(100) = NULL,
    @Course NVARCHAR(100) = NULL,
    @Year INT = NULL,
    @Semester INT = NULL,
    @AcademicGoals NVARCHAR(MAX) = NULL,
    @UserId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Users (
        FullName, Email, PasswordHash, Role, College, Course,
        Year, Semester, AcademicGoals, TotalXP, IsActive, CreatedAt, UpdatedAt
    )
    VALUES (
        @FullName, @Email, @PasswordHash, @Role, @College, @Course,
        @Year, @Semester, @AcademicGoals, 0, 1, GETDATE(), GETDATE()
    );

    SET @UserId = SCOPE_IDENTITY();
END
GO
```

#### sp_User_Login

```sql
CREATE PROCEDURE sp_User_Login
    @Email NVARCHAR(100),
    @PasswordHash NVARCHAR(256)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        UserId,
        FullName,
        Email,
        PasswordHash,
        Role,
        IsActive,
        TotalXP,
        CurrentLevelId,
        CurrentTitleId
    FROM Users
    WHERE Email = @Email AND IsActive = 1;
END
GO
```

#### sp_User_GetById

```sql
CREATE PROCEDURE sp_User_GetById
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        UserId,
        FullName,
        Email,
        Role,
        College,
        Course,
        Year,
        Semester,
        AcademicGoals,
        TotalXP,
        CurrentLevelId,
        CurrentTitleId,
        IsActive,
        CreatedAt,
        UpdatedAt
    FROM Users
    WHERE UserId = @UserId;
END
GO
```

### 5.2 Habit Procedures

#### sp_Habit_GetByUser

```sql
CREATE PROCEDURE sp_Habit_GetByUser
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        h.HabitId,
        h.UserId,
        h.CategoryId,
        c.Name AS CategoryName,
        h.Title,
        h.Description,
        h.HabitType,
        h.Frequency,
        h.ScheduledDays,
        h.TargetValue,
        h.Unit,
        h.Status,
        h.CurrentStreak,
        h.BestStreak,
        h.CreatedAt,
        h.UpdatedAt
    FROM Habits h
    LEFT JOIN Categories c ON h.CategoryId = c.CategoryId
    WHERE h.UserId = @UserId
    ORDER BY h.CreatedAt DESC;
END
GO
```

#### sp_Habit_Create

```sql
CREATE PROCEDURE sp_Habit_Create
    @UserId INT,
    @CategoryId INT = NULL,
    @Title NVARCHAR(100),
    @Description NVARCHAR(500) = NULL,
    @HabitType NVARCHAR(20),
    @Frequency NVARCHAR(20),
    @ScheduledDays NVARCHAR(50) = NULL,
    @TargetValue DECIMAL(10,2) = NULL,
    @Unit NVARCHAR(20) = NULL,
    @HabitId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Habits (
        UserId, CategoryId, Title, Description, HabitType,
        Frequency, ScheduledDays, TargetValue, Unit,
        Status, CurrentStreak, BestStreak, CreatedAt, UpdatedAt
    )
    VALUES (
        @UserId, @CategoryId, @Title, @Description, @HabitType,
        @Frequency, @ScheduledDays, @TargetValue, @Unit,
        'Active', 0, 0, GETDATE(), GETDATE()
    );

    SET @HabitId = SCOPE_IDENTITY();
END
GO
```

#### sp_Habit_LogCompletion

```sql
CREATE PROCEDURE sp_Habit_LogCompletion
    @HabitId INT,
    @UserId INT,
    @LogDate DATE,
    @IsCompleted BIT = 1,
    @ActualValue DECIMAL(10,2) = NULL,
    @ProgressPercentage DECIMAL(5,2) = NULL,
    @XPEarned INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if log already exists for this date
    IF NOT EXISTS (
        SELECT 1 FROM HabitLogs
        WHERE HabitId = @HabitId AND LogDate = @LogDate
    )
    BEGIN
        INSERT INTO HabitLogs (
            HabitId, UserId, LogDate, IsCompleted,
            ActualValue, ProgressPercentage, XPEarned, CreatedAt
        )
        VALUES (
            @HabitId, @UserId, @LogDate, @IsCompleted,
            @ActualValue, @ProgressPercentage, @XPEarned, GETDATE()
        );

        -- Update habit streak
        UPDATE Habits
        SET CurrentStreak = CurrentStreak + 1,
            BestStreak = CASE WHEN CurrentStreak + 1 > BestStreak THEN CurrentStreak + 1 ELSE BestStreak END,
            UpdatedAt = GETDATE()
        WHERE HabitId = @HabitId;
    END
END
GO
```

### 5.3 Task Procedures

#### sp_Task_GetByUser

```sql
CREATE PROCEDURE sp_Task_GetByUser
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        t.TaskId,
        t.UserId,
        t.GoalId,
        t.Title,
        t.Description,
        t.DueDate,
        t.Priority,
        t.CategoryId,
        c.Name AS CategoryName,
        t.Status,
        t.XPReward,
        t.CompletedAt,
        t.CreatedAt,
        t.UpdatedAt
    FROM Tasks t
    LEFT JOIN Categories c ON t.CategoryId = c.CategoryId
    WHERE t.UserId = @UserId
    ORDER BY t.DueDate, t.CreatedAt DESC;
END
GO
```

#### sp_Task_Create

```sql
CREATE PROCEDURE sp_Task_Create
    @UserId INT,
    @GoalId INT = NULL,
    @Title NVARCHAR(100),
    @Description NVARCHAR(500) = NULL,
    @DueDate DATETIME = NULL,
    @Priority NVARCHAR(20),
    @CategoryId INT = NULL,
    @XPReward INT = 10,
    @TaskId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tasks (
        UserId, GoalId, Title, Description, DueDate,
        Priority, CategoryId, Status, XPReward, CreatedAt, UpdatedAt
    )
    VALUES (
        @UserId, @GoalId, @Title, @Description, @DueDate,
        @Priority, @CategoryId, 'Pending', @XPReward, GETDATE(), GETDATE()
    );

    SET @TaskId = SCOPE_IDENTITY();
END
GO
```

#### sp_Task_Complete

```sql
CREATE PROCEDURE sp_Task_Complete
    @TaskId INT,
    @UserId INT,
    @XPEarned INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Tasks
    SET Status = 'Completed',
        CompletedAt = GETDATE(),
        UpdatedAt = GETDATE()
    WHERE TaskId = @TaskId AND UserId = @UserId;
END
GO
```

### 5.4 XP Transaction Procedures

#### sp_XP_AddTransaction

```sql
CREATE PROCEDURE sp_XP_AddTransaction
    @UserId INT,
    @Amount INT,
    @SourceType NVARCHAR(50),
    @SourceId INT = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Create XP transaction
    INSERT INTO XPTransactions (
        UserId, Amount, SourceType, SourceId, Description, CreatedAt
    )
    VALUES (
        @UserId, @Amount, @SourceType, @SourceId, @Description, GETDATE()
    );

    -- Update user total XP
    UPDATE Users
    SET TotalXP = TotalXP + @Amount,
        UpdatedAt = GETDATE()
    WHERE UserId = @UserId;
END
GO
```

#### sp_XP_GetUserTotal

```sql
CREATE PROCEDURE sp_XP_GetUserTotal
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TotalXP FROM Users WHERE UserId = @UserId;
END
GO
```

---

## 6. Web.config Configuration

Configure the database connection string in your ASP.NET Web Forms project.

### 6.1 Locate Web.config

The `Web.config` file is in the root of your ASP.NET Web Forms project.

### 6.2 Add Connection String

Add or update the `<connectionStrings>` section:

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <connectionStrings>
    <add name="IGNITEConnection"
         connectionString="Server=YOUR_SERVER_NAME;Database=IGNITEDB;Integrated Security=True;"
         providerName="System.Data.SqlClient" />
  </connectionStrings>

  <!-- Rest of Web.config -->
</configuration>
```

### 6.3 Connection String Options

**For Local Development with Windows Authentication:**
```xml
connectionString="Server=.\SQLEXPRESS;Database=IGNITEDB;Integrated Security=True;"
```

**For Local Development with SQL Server Authentication:**
```xml
connectionString="Server=.\SQLEXPRESS;Database=IGNITEDB;User Id=your_username;Password=your_password;"
```

**For Remote Server:**
```xml
connectionString="Server=server_address;Database=IGNITEDB;User Id=username;Password=password;"
```

### 6.4 Security Note

⚠️ **Never commit production credentials to Git.** Use:
- Environment variables for production
- Local config files excluded from Git
- Azure Key Vault or similar for cloud deployments

---

## 7. Helper Classes

Create helper classes to simplify database operations.

### 7.1 Create Helpers Folder

In your Visual Studio project, create a folder named `Helpers`.

### 7.2 DatabaseHelper.cs

Create `DatabaseHelper.cs` in the Helpers folder:

```csharp
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace IGNITE.Helpers
{
    public static class DatabaseHelper
    {
        private static readonly string ConnectionString =
            ConfigurationManager.ConnectionStrings["IGNITEConnection"].ConnectionString;

        public static SqlConnection GetConnection()
        {
            return new SqlConnection(ConnectionString);
        }

        public static int ExecuteNonQuery(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = GetConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters);
                }
                conn.Open();
                return cmd.ExecuteNonQuery();
            }
        }

        public static object ExecuteScalar(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = GetConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters);
                }
                conn.Open();
                return cmd.ExecuteScalar();
            }
        }

        public static DataTable ExecuteDataTable(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = GetConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters);
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public static SqlDataReader ExecuteReader(string query, SqlParameter[] parameters = null)
        {
            SqlConnection conn = GetConnection();
            SqlCommand cmd = new SqlCommand(query, conn);
            if (parameters != null)
            {
                cmd.Parameters.AddRange(parameters);
            }
            conn.Open();
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
    }
}
```

### 7.3 PasswordHelper.cs

Create `PasswordHelper.cs` for secure password hashing:

```csharp
using System;
using System.Security.Cryptography;
using System.Text;

namespace IGNITE.Helpers
{
    public static class PasswordHelper
    {
        public static string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                byte[] saltedBytes = Encoding.UTF8.GetBytes(password + "IGNITE_SALT_2024");
                byte[] hashBytes = sha256.ComputeHash(saltedBytes);
                return Convert.ToBase64String(hashBytes);
            }
        }

        public static bool VerifyPassword(string password, string storedHash)
        {
            string inputHash = HashPassword(password);
            return inputHash == storedHash;
        }
    }
}
```

---

## 8. Connecting Pages to Database

This section shows how to connect ASP.NET Web Forms pages to the database.

### 8.1 Basic Pattern

The typical pattern for connecting a page to the database:

```csharp
using System;
using System.Data;
using System.Data.SqlClient;
using IGNITE.Helpers;

public partial class Student_Habits : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check authentication
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]);
            LoadHabits(userId);
        }
    }

    private void LoadHabits(int userId)
    {
        using (SqlConnection conn = DatabaseHelper.GetConnection())
        {
            SqlCommand cmd = new SqlCommand("sp_Habit_GetByUser", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", userId);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            // Bind to GridView or Repeater
            gvHabits.DataSource = reader;
            gvHabits.DataBind();
        }
    }
}
```

### 8.2 Example: Creating a Habit

```csharp
protected void btnCreateHabit_Click(object sender, EventArgs e)
{
    int userId = Convert.ToInt32(Session["UserId"]);
    int habitId;

    using (SqlConnection conn = DatabaseHelper.GetConnection())
    {
        SqlCommand cmd = new SqlCommand("sp_Habit_Create", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@UserId", userId);
        cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
        cmd.Parameters.AddWithValue("@HabitType", ddlHabitType.SelectedValue);
        cmd.Parameters.AddWithValue("@Frequency", ddlFrequency.SelectedValue);
        cmd.Parameters.AddWithValue("@ScheduledDays", txtScheduledDays.Text);
        cmd.Parameters.AddWithValue("@TargetValue", Convert.ToDecimal(txtTargetValue.Text));
        cmd.Parameters.AddWithValue("@Unit", txtUnit.Text);

        SqlParameter outputId = new SqlParameter("@HabitId", SqlDbType.Int);
        outputId.Direction = ParameterDirection.Output;
        cmd.Parameters.Add(outputId);

        conn.Open();
        cmd.ExecuteNonQuery();

        habitId = Convert.ToInt32(outputId.Value);
    }

    // Refresh the habit list
    LoadHabits(userId);
}
```

### 8.3 Example: Logging Habit Completion

```csharp
protected void btnCompleteHabit_Click(object sender, EventArgs e)
{
    int userId = Convert.ToInt32(Session["UserId"]);
    int habitId = Convert.ToInt32(hfHabitId.Value);
    DateTime logDate = DateTime.Today;

    using (SqlConnection conn = DatabaseHelper.GetConnection())
    {
        SqlCommand cmd = new SqlCommand("sp_Habit_LogCompletion", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@HabitId", habitId);
        cmd.Parameters.AddWithValue("@UserId", userId);
        cmd.Parameters.AddWithValue("@LogDate", logDate);
        cmd.Parameters.AddWithValue("@IsCompleted", true);
        cmd.Parameters.AddWithValue("@XPEarned", 10);

        conn.Open();
        cmd.ExecuteNonQuery();
    }

    // Add XP transaction
    using (SqlConnection conn = DatabaseHelper.GetConnection())
    {
        SqlCommand cmd = new SqlCommand("sp_XP_AddTransaction", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@UserId", userId);
        cmd.Parameters.AddWithValue("@Amount", 10);
        cmd.Parameters.AddWithValue("@SourceType", "Habit");
        cmd.Parameters.AddWithValue("@SourceId", habitId);
        cmd.Parameters.AddWithValue("@Description", "Completed habit");

        conn.Open();
        cmd.ExecuteNonQuery();
    }

    // Refresh UI
    LoadHabits(userId);
}
```

### 8.4 Example: Reading Data with Simple SQL

```csharp
private void LoadDashboardData(int userId)
{
    using (SqlConnection conn = DatabaseHelper.GetConnection())
    {
        // Get today's habits
        string sql = @"
            SELECT COUNT(*) FROM Habits
            WHERE UserId = @UserId AND Status = 'Active'";

        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("@UserId", userId);

        conn.Open();
        int activeHabits = Convert.ToInt32(cmd.ExecuteScalar());
        lblActiveHabits.Text = activeHabits.ToString();

        // Get pending tasks
        sql = @"
            SELECT COUNT(*) FROM Tasks
            WHERE UserId = @UserId AND Status IN ('Pending', 'InProgress')";

        cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("@UserId", userId);

        int pendingTasks = Convert.ToInt32(cmd.ExecuteScalar());
        lblPendingTasks.Text = pendingTasks.ToString();
    }
}
```

---

## 9. Testing Database Connection

### 9.1 Create a Test Page

Create `TestDatabase.aspx` to verify the connection:

```aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestDatabase.aspx.cs" Inherits="IGNITE.TestDatabase" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Database Connection Test</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblStatus" runat="server" Text="Testing connection..." />
            <br />
            <asp:GridView ID="gvResults" runat="server" />
        </div>
    </form>
</body>
</html>
```

### 9.2 Test Database.aspx.cs

```csharp
using System;
using System.Data;
using System.Data.SqlClient;
using IGNITE.Helpers;

namespace IGNITE
{
    public partial class TestDatabase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    conn.Open();
                    lblStatus.Text = "✓ Database connection successful!";
                    lblStatus.ForeColor = System.Drawing.Color.Green;

                    // Test query
                    string sql = "SELECT COUNT(*) FROM Users";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    int userCount = Convert.ToInt32(cmd.ExecuteScalar());

                    lblStatus.Text += $" Found {userCount} users in database.";

                    // Show all tables
                    sql = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'";
                    cmd = new SqlCommand(sql, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    gvResults.DataSource = dt;
                    gvResults.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "✗ Database connection failed: " + ex.Message;
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
```

### 9.3 Run the Test

1. Build the project
2. Run `TestDatabase.aspx`
3. Verify the connection is successful
4. Check that all tables are listed

---

## 10. Security Checklist

Before proceeding with development, ensure:

- [ ] Connection string uses Windows Authentication or secure credentials
- [ ] Connection string is not committed to Git with production credentials
- [ ] All SQL queries use parameterized inputs (no string concatenation)
- [ ] Passwords are hashed using PasswordHelper (never plain text)
- [ ] All stored procedures validate inputs
- [ ] Web.config has proper authorization settings
- [ ] Database user has minimal required permissions
- [ ] HTTPS is configured for production
- [ ] Error messages do not expose database details

---

## Next Steps

After completing this database implementation plan:

1. **Implement Authentication** (Plan.md Phase 2)
   - Create Register.aspx page
   - Create Login.aspx page
   - Implement Forms Authentication
   - Set up Session management

2. **Create Master Pages** (Plan.md Phase 1)
   - StudentMaster.master
   - ManagementMaster.master

3. **Build Student Features** (Plan.md Phase 3)
   - Dashboard
   - Habits (first complete feature)
   - Tasks
   - Goals

4. **Implement Gamification** (Plan.md Phase 4)
   - XP system
   - Levels
   - Achievements

---

## Troubleshooting

### Common Issues

**Issue: "Login failed for user"**
- Solution: Check connection string credentials
- Verify SQL Server authentication mode

**Issue: "Cannot open database"**
- Solution: Verify database name in connection string
- Ensure database exists on the server

**Issue: "Could not find stored procedure"**
- Solution: Verify stored procedure name spelling
- Ensure stored procedure was created in the correct database

**Issue: Timeout errors**
- Solution: Check SQL Server is running
- Verify network connectivity to SQL Server

---

## References

- Plan.md - Main implementation plan
- Section 8: Database Architecture
- Section 10: Data Access Strategy
- Section 11: Stored Procedure Naming Convention
- Section 34: Web.config Configuration
- Section 38: Implementation Order (Phase 1)
