-- Admin Dashboard Stored Procedures
-- Run this script to create all stored procedures for admin pages

USE [ignite--DB]
GO

-- =============================================
-- Overview Page Procedures
-- =============================================

-- Get overview statistics
CREATE PROCEDURE sp_Admin_GetOverviewStats
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        (SELECT COUNT(*) FROM Users WHERE Role = 'Student') AS TotalStudents,
        (SELECT COUNT(*) FROM Users WHERE Role = 'Student' AND CONVERT(DATE, UpdatedAt) = CONVERT(DATE, GETDATE())) AS ActiveToday,
        (SELECT COUNT(*) FROM Challenges WHERE IsActive = 1 AND StartDate <= GETDATE() AND EndDate >= GETDATE()) AS ActiveChallenges,
        (SELECT COUNT(*) FROM Quests WHERE IsActive = 1 AND IsPublished = 1) AS DailyQuests,
        (SELECT COUNT(*) FROM Achievements WHERE IsActive = 1) AS TotalAchievements,
        (SELECT AVG(CAST(CurrentStreak AS DECIMAL(10,2))) FROM Habits WHERE Status = 'Active') AS AvgStreak;
END
GO

-- Get recent student activity
CREATE PROCEDURE sp_Admin_GetRecentActivity
    @TopCount INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@TopCount)
        u.UserId,
        u.FullName,
        u.Email,
        u.College,
        u.Course,
        u.Year,
        u.TotalXP,
        l.LevelNumber,
        l.Title AS LevelTitle,
        (SELECT TOP 1 CurrentStreak FROM Habits WHERE UserId = u.UserId ORDER BY UpdatedAt DESC) AS CurrentStreak,
        u.IsActive,
        u.UpdatedAt
    FROM Users u
    LEFT JOIN Levels l ON u.CurrentLevelId = l.LevelId
    WHERE u.Role = 'Student'
    ORDER BY u.UpdatedAt DESC;
END
GO

-- Get active challenges for overview
CREATE PROCEDURE sp_Admin_GetActiveChallenges
    @TopCount INT = 5
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@TopCount)
        c.ChallengeId,
        c.Title,
        c.Description,
        c.CategoryId,
        cat.Name AS CategoryName,
        c.Difficulty,
        c.StartDate,
        c.EndDate,
        c.XPReward,
        (SELECT COUNT(*) FROM ChallengeParticipants WHERE ChallengeId = c.ChallengeId) AS ParticipantCount,
        c.IsPublished,
        c.IsActive
    FROM Challenges c
    LEFT JOIN Categories cat ON c.CategoryId = cat.CategoryId
    WHERE c.IsActive = 1 AND c.StartDate <= GETDATE() AND c.EndDate >= GETDATE()
    ORDER BY c.EndDate ASC;
END
GO

-- Get active quests for overview
CREATE PROCEDURE sp_Admin_GetActiveQuests
    @TopCount INT = 5
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@TopCount)
        q.QuestId,
        q.Title,
        q.Description,
        q.QuestType,
        q.RequirementType,
        q.RequirementValue,
        q.XPReward,
        q.StartDate,
        q.EndDate,
        (SELECT COUNT(*) FROM QuestProgress WHERE QuestId = q.QuestId) AS ParticipantCount,
        q.IsPublished,
        q.IsActive
    FROM Quests q
    WHERE q.IsActive = 1 AND q.IsPublished = 1
    ORDER BY q.CreatedAt DESC;
END
GO

-- Get achievement statistics
CREATE PROCEDURE sp_Admin_GetAchievementStats
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        (SELECT COUNT(*) FROM Achievements WHERE IsActive = 1) AS TotalPublished,
        (SELECT COUNT(*) FROM Achievements WHERE IsActive = 1 AND IsHidden = 0) AS ActiveGlobal,
        (SELECT COUNT(*) FROM Achievements WHERE CreatedAt >= DATEADD(DAY, -7, GETDATE())) AS RecentlyAdded,
        (SELECT COUNT(*) FROM Achievements WHERE IsActive = 0 OR IsHidden = 1) AS HiddenDraft;
END
GO

-- =============================================
-- Challenges Page Procedures
-- =============================================

-- Get all challenges for admin with pagination and filters
CREATE PROCEDURE sp_Challenge_GetAllForAdmin
    @Search NVARCHAR(100) = NULL,
    @Category INT = NULL,
    @Status NVARCHAR(20) = NULL,
    @SortBy NVARCHAR(20) = 'Latest',
    @Page INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Offset INT = (@Page - 1) * @PageSize;
    DECLARE @OrderBy NVARCHAR(100);

    IF @SortBy = 'Latest'
        SET @OrderBy = 'ORDER BY c.CreatedAt DESC';
    ELSE IF @SortBy = 'StartDate'
        SET @OrderBy = 'ORDER BY c.StartDate DESC';
    ELSE IF @SortBy = 'EndDate'
        SET @OrderBy = 'ORDER BY c.EndDate ASC';
    ELSE IF @SortBy = 'Title'
        SET @OrderBy = 'ORDER BY c.Title ASC';
    ELSE
        SET @OrderBy = 'ORDER BY c.CreatedAt DESC';

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = N'
    SELECT
        c.ChallengeId,
        c.Title,
        c.Description,
        c.CategoryId,
        cat.Name AS CategoryName,
        c.Difficulty,
        c.RequirementType,
        c.RequirementValue,
        c.StartDate,
        c.EndDate,
        c.XPReward,
        c.IsPublished,
        c.IsActive,
        c.CreatedAt,
        (SELECT COUNT(*) FROM ChallengeParticipants WHERE ChallengeId = c.ChallengeId) AS ParticipantCount
    FROM Challenges c
    LEFT JOIN Categories cat ON c.CategoryId = cat.CategoryId
    WHERE 1=1';

    IF @Search IS NOT NULL
        SET @SQL = @SQL + N' AND (c.Title LIKE ''%'' + @Search + ''%'' OR c.Description LIKE ''%'' + @Search + ''%'')';

    IF @Category IS NOT NULL
        SET @SQL = @SQL + N' AND c.CategoryId = @Category';

    IF @Status = 'Published'
        SET @SQL = @SQL + N' AND c.IsPublished = 1';
    ELSE IF @Status = 'Draft'
        SET @SQL = @SQL + N' AND c.IsPublished = 0';
    ELSE IF @Status = 'Archived'
        SET @SQL = @SQL + N' AND c.IsActive = 0';

    SET @SQL = @SQL + N' ' + @OrderBy + N' OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY';

    EXEC sp_executesql @SQL,
        N'@Search NVARCHAR(100), @Category INT, @Offset INT, @PageSize INT',
        @Search, @Category, @Offset, @PageSize;
END
GO

-- Get challenge count for pagination
CREATE PROCEDURE sp_Challenge_GetCount
    @Search NVARCHAR(100) = NULL,
    @Category INT = NULL,
    @Status NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = N'
    SELECT COUNT(*)
    FROM Challenges c
    WHERE 1=1';

    IF @Search IS NOT NULL
        SET @SQL = @SQL + N' AND (c.Title LIKE ''%'' + @Search + ''%'' OR c.Description LIKE ''%'' + @Search + ''%'')';

    IF @Category IS NOT NULL
        SET @SQL = @SQL + N' AND c.CategoryId = @Category';

    IF @Status = 'Published'
        SET @SQL = @SQL + N' AND c.IsPublished = 1';
    ELSE IF @Status = 'Draft'
        SET @SQL = @SQL + N' AND c.IsPublished = 0';
    ELSE IF @Status = 'Archived'
        SET @SQL = @SQL + N' AND c.IsActive = 0';

    EXEC sp_executesql @SQL, N'@Search NVARCHAR(100), @Category INT', @Search, @Category;
END
GO

-- Get admin challenge statistics
CREATE PROCEDURE sp_Challenge_GetAdminStats
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        (SELECT COUNT(*) FROM Challenges WHERE IsActive = 1 AND StartDate <= GETDATE() AND EndDate >= GETDATE()) AS ActiveChallenges,
        (SELECT COUNT(*) FROM ChallengeParticipants) AS TotalSubmissions,
        (SELECT CASE
            WHEN (SELECT COUNT(*) FROM ChallengeParticipants) > 0
            THEN CAST((SELECT COUNT(*) FROM ChallengeParticipants WHERE IsCompleted = 1) * 100.0 / (SELECT COUNT(*) FROM ChallengeParticipants) AS DECIMAL(5,2))
            ELSE 0
        END) AS AvgCompletion,
        (SELECT SUM(Amount) FROM XPTransactions WHERE SourceType = 'Challenge') AS XPDistributed;
END
GO

-- =============================================
-- Quests Page Procedures
-- =============================================

-- Get all quests for admin with pagination and filters
CREATE PROCEDURE sp_Quest_GetAllForAdmin
    @Search NVARCHAR(100) = NULL,
    @Type NVARCHAR(20) = NULL,
    @Status NVARCHAR(20) = NULL,
    @SortBy NVARCHAR(20) = 'Latest',
    @Page INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Offset INT = (@Page - 1) * @PageSize;
    DECLARE @OrderBy NVARCHAR(100);

    IF @SortBy = 'Latest'
        SET @OrderBy = 'ORDER BY q.CreatedAt DESC';
    ELSE IF @SortBy = 'XPReward'
        SET @OrderBy = 'ORDER BY q.XPReward DESC';
    ELSE IF @SortBy = 'Title'
        SET @OrderBy = 'ORDER BY q.Title ASC';
    ELSE
        SET @OrderBy = 'ORDER BY q.CreatedAt DESC';

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = N'
    SELECT
        q.QuestId,
        q.Title,
        q.Description,
        q.QuestType,
        q.RequirementType,
        q.RequirementValue,
        q.XPReward,
        q.StartDate,
        q.EndDate,
        q.IsPublished,
        q.IsActive,
        q.CreatedAt,
        (SELECT COUNT(*) FROM QuestProgress WHERE QuestId = q.QuestId) AS ParticipantCount
    FROM Quests q
    WHERE 1=1';

    IF @Search IS NOT NULL
        SET @SQL = @SQL + N' AND (q.Title LIKE ''%'' + @Search + ''%'' OR q.Description LIKE ''%'' + @Search + ''%'')';

    IF @Type IS NOT NULL
        SET @SQL = @SQL + N' AND q.QuestType = @Type';

    IF @Status = 'Published'
        SET @SQL = @SQL + N' AND q.IsPublished = 1';
    ELSE IF @Status = 'Draft'
        SET @SQL = @SQL + N' AND q.IsPublished = 0';
    ELSE IF @Status = 'Archived'
        SET @SQL = @SQL + N' AND q.IsActive = 0';

    SET @SQL = @SQL + N' ' + @OrderBy + N' OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY';

    EXEC sp_executesql @SQL,
        N'@Search NVARCHAR(100), @Type NVARCHAR(20), @Offset INT, @PageSize INT',
        @Search, @Type, @Offset, @PageSize;
END
GO

-- Get quest count for pagination
CREATE PROCEDURE sp_Quest_GetCount
    @Search NVARCHAR(100) = NULL,
    @Type NVARCHAR(20) = NULL,
    @Status NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = N'
    SELECT COUNT(*)
    FROM Quests q
    WHERE 1=1';

    IF @Search IS NOT NULL
        SET @SQL = @SQL + N' AND (q.Title LIKE ''%'' + @Search + ''%'' OR q.Description LIKE ''%'' + @Search + ''%'')';

    IF @Type IS NOT NULL
        SET @SQL = @SQL + N' AND q.QuestType = @Type';

    IF @Status = 'Published'
        SET @SQL = @SQL + N' AND q.IsPublished = 1';
    ELSE IF @Status = 'Draft'
        SET @SQL = @SQL + N' AND q.IsPublished = 0';
    ELSE IF @Status = 'Archived'
        SET @SQL = @SQL + N' AND q.IsActive = 0';

    EXEC sp_executesql @SQL, N'@Search NVARCHAR(100), @Type NVARCHAR(20)', @Search, @Type;
END
GO

-- Get admin quest statistics
CREATE PROCEDURE sp_Quest_GetAdminStats
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        (SELECT COUNT(*) FROM Quests WHERE IsActive = 1 AND IsPublished = 1) AS ActiveQuests,
        (SELECT COUNT(*) FROM QuestProgress) AS TotalParticipations,
        (SELECT CASE
            WHEN (SELECT COUNT(*) FROM QuestProgress) > 0
            THEN CAST((SELECT COUNT(*) FROM QuestProgress WHERE IsCompleted = 1) * 100.0 / (SELECT COUNT(*) FROM QuestProgress) AS DECIMAL(5,2))
            ELSE 0
        END) AS AvgCompletion,
        (SELECT SUM(XPReward) FROM Quests WHERE IsPublished = 1) AS TotalXPReward;
END
GO

-- =============================================
-- Student Profile Procedures
-- =============================================

-- Get student profile data
CREATE PROCEDURE sp_User_GetStudentProfile
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        u.UserId,
        u.FullName,
        u.Email,
        u.College,
        u.Course,
        u.Year,
        u.Semester,
        u.AcademicGoals,
        u.TotalXP,
        u.CurrentLevelId,
        u.CurrentTitleId,
        u.IsActive,
        u.CreatedAt,
        u.UpdatedAt,
        l.LevelNumber,
        l.Title AS LevelTitle,
        t.Name AS TitleName
    FROM Users u
    LEFT JOIN Levels l ON u.CurrentLevelId = l.LevelId
    LEFT JOIN Titles t ON u.CurrentTitleId = t.TitleId
    WHERE u.UserId = @UserId;
END
GO

-- Get student achievements
CREATE PROCEDURE sp_User_GetStudentAchievements
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        a.AchievementId,
        a.Name,
        a.Description,
        a.Icon,
        a.RequirementType,
        a.RequirementValue,
        a.XPReward,
        ua.UnlockedAt
    FROM UserAchievements ua
    INNER JOIN Achievements a ON ua.AchievementId = a.AchievementId
    WHERE ua.UserId = @UserId
    ORDER BY ua.UnlockedAt DESC;
END
GO

-- Get student statistics
CREATE PROCEDURE sp_User_GetStudentStats
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        (SELECT COUNT(*) FROM Habits WHERE UserId = @UserId AND Status = 'Active') AS ActiveHabits,
        (SELECT COUNT(*) FROM Tasks WHERE UserId = @UserId AND Status = 'Completed') AS CompletedTasks,
        (SELECT COUNT(*) FROM Goals WHERE UserId = @UserId AND Status = 'Completed') AS CompletedGoals,
        (SELECT COUNT(*) FROM ChallengeParticipants WHERE UserId = @UserId AND IsCompleted = 1) AS CompletedChallenges,
        (SELECT COUNT(*) FROM QuestProgress WHERE UserId = @UserId AND IsCompleted = 1) AS CompletedQuests,
        (SELECT SUM(CurrentStreak) FROM Habits WHERE UserId = @UserId) AS TotalStreak,
        (SELECT MAX(CurrentStreak) FROM Habits WHERE UserId = @UserId) AS BestStreak;
END
GO

-- Deactivate student account
CREATE PROCEDURE sp_User_Deactivate
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Users
    SET IsActive = 0,
        UpdatedAt = GETDATE()
    WHERE UserId = @UserId;
END
GO

-- =============================================
-- Challenge Details Procedures
-- =============================================

-- Get challenge details by ID
CREATE PROCEDURE sp_Challenge_GetDetailsById
    @ChallengeId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.ChallengeId,
        c.Title,
        c.Description,
        c.CategoryId,
        cat.Name AS CategoryName,
        c.Difficulty,
        c.RequirementType,
        c.RequirementValue,
        c.StartDate,
        c.EndDate,
        c.XPReward,
        c.AchievementId,
        ach.Name AS AchievementName,
        c.IsPublished,
        c.IsActive,
        c.CreatedBy,
        u.FullName AS CreatedByName,
        c.CreatedAt,
        c.UpdatedAt
    FROM Challenges c
    LEFT JOIN Categories cat ON c.CategoryId = cat.CategoryId
    LEFT JOIN Achievements ach ON c.AchievementId = ach.AchievementId
    LEFT JOIN Users u ON c.CreatedBy = u.UserId
    WHERE c.ChallengeId = @ChallengeId;
END
GO

-- Get challenge participants
CREATE PROCEDURE sp_Challenge_GetParticipants
    @ChallengeId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        cp.ParticipantId,
        cp.UserId,
        u.FullName,
        u.Email,
        cp.JoinDate,
        cp.CurrentProgress,
        cp.IsCompleted,
        cp.CompletedAt
    FROM ChallengeParticipants cp
    INNER JOIN Users u ON cp.UserId = u.UserId
    WHERE cp.ChallengeId = @ChallengeId
    ORDER BY cp.JoinDate DESC;
END
GO

-- Archive challenge
CREATE PROCEDURE sp_Challenge_Archive
    @ChallengeId INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Challenges
    SET IsActive = 0,
        UpdatedAt = GETDATE()
    WHERE ChallengeId = @ChallengeId;
END
GO

-- =============================================
-- Create/Update Challenge Procedures
-- =============================================

-- Update challenge
CREATE PROCEDURE sp_Challenge_Update
    @ChallengeId INT,
    @Title NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @CategoryId INT = NULL,
    @Difficulty NVARCHAR(20),
    @StartDate DATETIME,
    @EndDate DATETIME,
    @RequirementType NVARCHAR(50),
    @RequirementValue NVARCHAR(100),
    @XPReward INT,
    @AchievementId INT = NULL,
    @IsPublished BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Challenges
    SET Title = @Title,
        Description = @Description,
        CategoryId = @CategoryId,
        Difficulty = @Difficulty,
        StartDate = @StartDate,
        EndDate = @EndDate,
        RequirementType = @RequirementType,
        RequirementValue = @RequirementValue,
        XPReward = @XPReward,
        AchievementId = @AchievementId,
        IsPublished = @IsPublished,
        UpdatedAt = GETDATE()
    WHERE ChallengeId = @ChallengeId;
END
GO

-- =============================================
-- Create/Update Quest Procedures
-- =============================================

-- Create quest
CREATE PROCEDURE sp_Quest_Create
    @Title NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @QuestType NVARCHAR(20),
    @RequirementType NVARCHAR(50),
    @RequirementValue NVARCHAR(100),
    @XPReward INT,
    @StartDate DATETIME = NULL,
    @EndDate DATETIME = NULL,
    @IsPublished BIT = 0,
    @CreatedBy INT = NULL,
    @QuestId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Quests (
        Title, Description, QuestType, RequirementType, RequirementValue,
        XPReward, StartDate, EndDate, IsPublished, IsActive, CreatedBy, CreatedAt, UpdatedAt
    )
    VALUES (
        @Title, @Description, @QuestType, @RequirementType, @RequirementValue,
        @XPReward, @StartDate, @EndDate, @IsPublished, 1, @CreatedBy, GETDATE(), GETDATE()
    );

    SET @QuestId = SCOPE_IDENTITY();
END
GO

-- Update quest
CREATE PROCEDURE sp_Quest_Update
    @QuestId INT,
    @Title NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @QuestType NVARCHAR(20),
    @RequirementType NVARCHAR(50),
    @RequirementValue NVARCHAR(100),
    @XPReward INT,
    @StartDate DATETIME = NULL,
    @EndDate DATETIME = NULL,
    @IsPublished BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Quests
    SET Title = @Title,
        Description = @Description,
        QuestType = @QuestType,
        RequirementType = @RequirementType,
        RequirementValue = @RequirementValue,
        XPReward = @XPReward,
        StartDate = @StartDate,
        EndDate = @EndDate,
        IsPublished = @IsPublished,
        UpdatedAt = GETDATE()
    WHERE QuestId = @QuestId;
END
GO

PRINT 'All admin stored procedures created successfully.';
