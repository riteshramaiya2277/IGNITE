-- =============================================
-- IGNITE Database - Demo Data Insert Script
-- =============================================
-- This script inserts demo records for all tables
-- Run this after creating the database schema
-- =============================================

USE [Ignite--DB];
GO

-- =============================================
-- 1. Categories (No dependencies)
-- =============================================
INSERT INTO Categories (Name, Description, Icon, IsActive, CreatedAt, UpdatedAt)
VALUES 
    ('Academic', 'Study-related habits and tasks', '📚', 1, GETDATE(), GETDATE()),
    ('Health', 'Physical and mental wellness', '💪', 1, GETDATE(), GETDATE()),
    ('Productivity', 'Time management and organization', '⚡', 1, GETDATE(), GETDATE()),
    ('Social', 'Community and networking', '👥', 1, GETDATE(), GETDATE()),
    ('Personal Development', 'Self-improvement goals', '🌟', 1, GETDATE(), GETDATE());
GO

-- =============================================
-- 2. Levels (No dependencies)
-- =============================================
INSERT INTO Levels (LevelNumber, RequiredXP, Title, CreatedAt)
VALUES 
    (1, 0, 'Novice', GETDATE()),
    (2, 100, 'Apprentice', GETDATE()),
    (3, 250, 'Achiever', GETDATE()),
    (4, 500, 'Expert', GETDATE()),
    (5, 1000, 'Master', GETDATE()),
    (6, 2000, 'Grandmaster', GETDATE()),
    (7, 5000, 'Legend', GETDATE()),
    (8, 10000, 'Champion', GETDATE()),
    (9, 20000, 'Hero', GETDATE()),
    (10, 50000, 'Supreme', GETDATE());
GO



-- =============================================
-- 4. Achievements (No dependencies)
-- =============================================
INSERT INTO Achievements (Name, Description, Icon, RequirementType, RequirementValue, XPReward, IsHidden, IsActive, CreatedAt)
VALUES 
    ('First Steps', 'Complete your first habit', '🎯', 'HabitCount', '1', 50, 0, 1, GETDATE()),
    ('Task Master', 'Complete 10 tasks', '✅', 'TaskCount', '10', 100, 0, 1, GETDATE()),
    ('Streak Starter', 'Maintain a 7-day streak', '🔥', 'StreakDays', '7', 150, 0, 1, GETDATE()),
    ('Goal Getter', 'Complete your first goal', '🏆', 'GoalCount', '1', 200, 0, 1, GETDATE()),
    ('Challenge Accepted', 'Join your first challenge', '⚔️', 'ChallengeCount', '1', 75, 0, 1, GETDATE()),
    ('Questioneer', 'Complete your first quest', '🗺️', 'QuestCount', '1', 100, 0, 1, GETDATE()),
    ('Journal Keeper', 'Write 10 journal entries', '📝', 'JournalCount', '10', 80, 0, 1, GETDATE()),
    ('Note Taker', 'Create 20 notes', '📌', 'NoteCount', '20', 60, 0, 1, GETDATE()),
    ('XP Hunter', 'Earn 1,000 XP in a week', '💎', 'XPWeekly', '1000', 250, 0, 1, GETDATE()),
    ('Perfect Week', 'Complete all daily habits for a week', '⭐', 'PerfectWeek', '1', 300, 0, 1, GETDATE());
GO

-- =============================================
-- 5. Users (No dependencies, but references Levels)
-- =============================================
INSERT INTO Users (FullName, Email, PasswordHash, Role, College, Course, Year, Semester, AcademicGoals, TotalXP, CurrentLevelId, IsActive, CreatedAt, UpdatedAt)
VALUES 
    ('John Smith', 'john.smith@college.edu', 'hashed_password_1', 'Student', 'State University', 'Computer Science', 3, 5, 'Maintain 3.5 GPA, complete internship', 1250, 3, 1, GETDATE(), GETDATE()),
    ('Sarah Johnson', 'sarah.johnson@college.edu', 'hashed_password_2', 'Student', 'State University', 'Psychology', 2, 3, 'Study consistently, join research project', 850, 2, 1, GETDATE(), GETDATE()),
    ('Mike Wilson', 'mike.wilson@college.edu', 'hashed_password_3', 'Student', 'State University', 'Business Administration', 4, 7, 'Land job offer, maintain network', 2100, 4, 1, GETDATE(), GETDATE()),
    ('Emily Davis', 'emily.davis@college.edu', 'hashed_password_4', 'Student', 'State University', 'Biology', 1, 1, 'Build strong foundation, join lab', 450, 2, 1, GETDATE(), GETDATE()),
    ('Admin User', 'admin@ignite.edu', 'hashed_password_admin', 'Management', NULL, NULL, NULL, NULL, 'Manage student engagement', 5000, 6, 1, GETDATE(), GETDATE());
GO

-- =============================================
-- 6. Habits (Depends on Users and Categories)
-- =============================================
INSERT INTO Habits (UserId, CategoryId, Title, Description, HabitType, Frequency, ScheduledDays, TargetValue, Unit, Status, CurrentStreak, BestStreak, CreatedAt, UpdatedAt)
VALUES 
    -- John's habits
    (1, 1, 'Morning Study', 'Study for 1 hour every morning', 'Measurable', 'Daily', NULL, 1.0, 'hours', 'Active', 12, 15, GETDATE(), GETDATE()),
    (1, 2, 'Exercise', '30 minutes of exercise', 'Measurable', 'Daily', NULL, 30.0, 'minutes', 'Active', 5, 8, GETDATE(), GETDATE()),
    (1, 3, 'Plan Day', 'Create daily to-do list', 'Binary', 'Daily', NULL, NULL, NULL, 'Active', 20, 20, GETDATE(), GETDATE()),
    
    -- Sarah's habits
    (2, 1, 'Read Textbook', 'Read 20 pages of textbook', 'Measurable', 'Daily', NULL, 20.0, 'pages', 'Active', 8, 10, GETDATE(), GETDATE()),
    (2, 2, 'Meditation', '10 minutes meditation', 'Measurable', 'Daily', NULL, 10.0, 'minutes', 'Active', 3, 5, GETDATE(), GETDATE()),
    
    -- Mike's habits
    (3, 3, 'Networking', 'Connect with 1 professional', 'Binary', 'Weekly', NULL, NULL, NULL, 'Active', 2, 4, GETDATE(), GETDATE()),
    (3, 1, 'Review Notes', 'Review lecture notes', 'Binary', 'SelectedDays', 'Mon,Wed,Fri', NULL, NULL, 'Active', 6, 6, GETDATE(), GETDATE()),
    
    -- Emily's habits
    (4, 1, 'Lab Work', '2 hours in lab', 'Measurable', 'SelectedDays', 'Tue,Thu', 2.0, 'hours', 'Active', 4, 4, GETDATE(), GETDATE()),
    (4, 5, 'Read Research Paper', 'Read 1 research paper weekly', 'Binary', 'Weekly', NULL, NULL, NULL, 'Active', 1, 1, GETDATE(), GETDATE());
GO

-- =============================================
-- 7. HabitLogs (Depends on Habits and Users)
-- =============================================
INSERT INTO HabitLogs (HabitId, UserId, LogDate, IsCompleted, ActualValue, ProgressPercentage, XPEarned, CreatedAt)
VALUES 
    -- John's habit logs (last 7 days)
    (1, 1, DATEADD(DAY, -6, GETDATE()), 1, 1.0, 100.0, 10, GETDATE()),
    (1, 1, DATEADD(DAY, -5, GETDATE()), 1, 1.0, 100.0, 10, GETDATE()),
    (1, 1, DATEADD(DAY, -4, GETDATE()), 1, 1.0, 100.0, 10, GETDATE()),
    (1, 1, DATEADD(DAY, -3, GETDATE()), 1, 1.0, 100.0, 10, GETDATE()),
    (1, 1, DATEADD(DAY, -2, GETDATE()), 1, 1.0, 100.0, 10, GETDATE()),
    (1, 1, DATEADD(DAY, -1, GETDATE()), 1, 1.0, 100.0, 10, GETDATE()),
    (1, 1, GETDATE(), 1, 1.0, 100.0, 10, GETDATE()),
    
    (2, 1, DATEADD(DAY, -6, GETDATE()), 1, 30.0, 100.0, 10, GETDATE()),
    (2, 1, DATEADD(DAY, -5, GETDATE()), 1, 30.0, 100.0, 10, GETDATE()),
    (2, 1, DATEADD(DAY, -4, GETDATE()), 1, 30.0, 100.0, 10, GETDATE()),
    (2, 1, DATEADD(DAY, -3, GETDATE()), 1, 30.0, 100.0, 10, GETDATE()),
    (2, 1, DATEADD(DAY, -2, GETDATE()), 1, 30.0, 100.0, 10, GETDATE()),
    (2, 1, DATEADD(DAY, -1, GETDATE()), 1, 30.0, 100.0, 10, GETDATE()),
    (2, 1, GETDATE(), 1, 30.0, 100.0, 10, GETDATE()),
    
    -- Sarah's habit logs
    (4, 2, DATEADD(DAY, -4, GETDATE()), 1, 20.0, 100.0, 10, GETDATE()),
    (4, 2, DATEADD(DAY, -3, GETDATE()), 1, 20.0, 100.0, 10, GETDATE()),
    (4, 2, DATEADD(DAY, -2, GETDATE()), 1, 20.0, 100.0, 10, GETDATE()),
    (4, 2, DATEADD(DAY, -1, GETDATE()), 1, 20.0, 100.0, 10, GETDATE()),
    (4, 2, GETDATE(), 1, 20.0, 100.0, 10, GETDATE());
GO

-- =============================================
-- 8. Goals (Depends on Users)
-- =============================================
INSERT INTO Goals (UserId, Title, Specific, Measurable, Achievable, Relevant, TimeBound, TargetValue, CurrentValue, StartDate, EndDate, Status, XPReward, CreatedAt, UpdatedAt)
VALUES 
    -- John's goals
    (1, 'Complete Semester with 3.5 GPA', 'Study consistently for all courses', 'Maintain 3.5 GPA across all courses', 'Create study schedule and stick to it', 'Essential for scholarship requirements', 'By end of current semester', 3.5, 3.2, DATEADD(DAY, -30, GETDATE()), DATEADD(DAY, 60, GETDATE()), 'InProgress', 100, GETDATE(), GETDATE()),
    (1, 'Learn Python Basics', 'Complete online Python course', 'Finish 10 modules with 80%+ scores', 'Dedicate 2 hours daily', 'Required for internship', 'Within 2 months', 10.0, 6.0, DATEADD(DAY, -15, GETDATE()), DATEADD(DAY, 45, GETDATE()), 'InProgress', 150, GETDATE(), GETDATE()),
    
    -- Sarah's goals
    (2, 'Read 12 Psychology Books', 'Read one book per month', 'Complete 12 books by year end', 'Set aside 30 mins daily reading', 'Build knowledge base', 'By end of year', 12.0, 3.0, DATEADD(DAY, -60, GETDATE()), DATEADD(DAY, 305, GETDATE()), 'InProgress', 200, GETDATE(), GETDATE()),
    
    -- Mike's goals
    (3, 'Secure Summer Internship', 'Apply to 20 companies', 'Get at least 3 interview offers', 'Network with alumni, update resume', 'Career advancement', 'By summer break', 20.0, 12.0, DATEADD(DAY, -20, GETDATE()), DATEADD(DAY, 90, GETDATE()), 'InProgress', 250, GETDATE(), GETDATE()),
    
    -- Emily's goals
    (4, 'Join Research Lab', 'Find and join biology research lab', 'Secure position in active lab', 'Contact professors, prepare CV', 'Graduate school preparation', 'This semester', 1.0, 0.0, DATEADD(DAY, -10, GETDATE()), DATEADD(DAY, 70, GETDATE()), 'InProgress', 200, GETDATE(), GETDATE());
GO

-- =============================================
-- 9. GoalMilestones (Depends on Goals)
-- =============================================
INSERT INTO GoalMilestones (GoalId, Title, TargetValue, CurrentValue, DueDate, Status, CreatedAt, UpdatedAt)
VALUES 
    -- John's goal milestones
    (1, 'Midterm GPA Check', 3.5, 3.2, DATEADD(DAY, 30, GETDATE()), 'Pending', GETDATE(), GETDATE()),
    (1, 'Final GPA Achievement', 3.5, 0.0, DATEADD(DAY, 60, GETDATE()), 'Pending', GETDATE(), GETDATE()),
    (2, 'Complete First 5 Modules', 5.0, 5.0, DATEADD(DAY, -10, GETDATE()), 'Completed', GETDATE(), GETDATE()),
    (2, 'Complete All 10 Modules', 10.0, 6.0, DATEADD(DAY, 45, GETDATE()), 'Pending', GETDATE(), GETDATE()),
    
    -- Sarah's goal milestones
    (3, 'Complete 3 Books', 3.0, 3.0, DATEADD(DAY, -15, GETDATE()), 'Completed', GETDATE(), GETDATE()),
    (3, 'Complete 6 Books', 6.0, 0.0, DATEADD(DAY, 120, GETDATE()), 'Pending', GETDATE(), GETDATE()),
    
    -- Mike's goal milestones
    (4, 'Submit 10 Applications', 10.0, 10.0, DATEADD(DAY, -5, GETDATE()), 'Completed', GETDATE(), GETDATE()),
    (4, 'Submit 20 Applications', 20.0, 12.0, DATEADD(DAY, 90, GETDATE()), 'Pending', GETDATE(), GETDATE());
GO

-- =============================================
-- 10. Tasks (Depends on Users, Goals, and Categories)
-- =============================================
INSERT INTO Tasks (UserId, GoalId, Title, Description, DueDate, Priority, CategoryId, Status, XPReward, CompletedAt, CreatedAt, UpdatedAt)
VALUES 
    -- John's tasks
    (1, 1, 'Complete Math Assignment', 'Chapter 5 problems 1-20', DATEADD(DAY, 2, GETDATE()), 'High', 1, 'Pending', 15, NULL, GETDATE(), GETDATE()),
    (1, 1, 'Prepare for Physics Quiz', 'Review chapters 3-4', DATEADD(DAY, 3, GETDATE()), 'High', 1, 'InProgress', 15, NULL, GETDATE(), GETDATE()),
    (1, 2, 'Complete Python Module 7', 'Functions and loops', DATEADD(DAY, 5, GETDATE()), 'Medium', 1, 'Pending', 10, NULL, GETDATE(), GETDATE()),
    (1, NULL, 'Buy Textbooks', 'Purchase required books for semester', DATEADD(DAY, 1, GETDATE()), 'Medium', 3, 'Completed', 10, DATEADD(DAY, -1, GETDATE()), GETDATE(), GETDATE()),
    
    -- Sarah's tasks
    (2, 3, 'Read Chapter 1-3', 'Current psychology book', DATEADD(DAY, 7, GETDATE()), 'Medium', 1, 'Pending', 10, NULL, GETDATE(), GETDATE()),
    (2, NULL, 'Write Paper Draft', 'Psychology research paper', DATEADD(DAY, 10, GETDATE()), 'High', 1, 'InProgress', 20, NULL, GETDATE(), GETDATE()),
    
    -- Mike's tasks
    (3, 4, 'Update Resume', 'Add recent projects and skills', DATEADD(DAY, 1, GETDATE()), 'High', 3, 'Pending', 15, NULL, GETDATE(), GETDATE()),
    (3, 4, 'Apply to Company A', 'Submit application for summer internship', DATEADD(DAY, 3, GETDATE()), 'High', 3, 'Pending', 15, NULL, GETDATE(), GETDATE()),
    (3, 4, 'Network with Alumni', 'Contact 3 alumni from program', DATEADD(DAY, 5, GETDATE()), 'Medium', 4, 'Pending', 10, NULL, GETDATE(), GETDATE()),
    
    -- Emily's tasks
    (4, 5, 'Contact Professor Smith', 'Inquire about research opportunities', DATEADD(DAY, 2, GETDATE()), 'High', 1, 'Pending', 15, NULL, GETDATE(), GETDATE()),
    (4, 5, 'Prepare Research CV', 'Highlight relevant coursework', DATEADD(DAY, 3, GETDATE()), 'Medium', 1, 'Pending', 10, NULL, GETDATE(), GETDATE());
GO

-- =============================================
-- 11. Challenges (Depends on Categories, Achievements, and Users)
-- =============================================
INSERT INTO Challenges (Title, Description, CategoryId, Difficulty, StartDate, EndDate, RequirementType, RequirementValue, XPReward, AchievementId, IsPublished, IsActive, CreatedBy, CreatedAt, UpdatedAt)
VALUES 
    ('7-Day Study Streak', 'Study every day for 7 consecutive days', 1, 'Medium', DATEADD(DAY, -3, GETDATE()), DATEADD(DAY, 10, GETDATE()), 'HabitBased', '7', 200, 3, 1, 1, 5, GETDATE(), GETDATE()),
    ('Fitness Challenge', 'Exercise for 30 minutes daily for 14 days', 2, 'Hard', DATEADD(DAY, -5, GETDATE()), DATEADD(DAY, 14, GETDATE()), 'HabitBased', '14', 300, NULL, 1, 1, 5, GETDATE(), GETDATE()),
    ('Task Master Week', 'Complete 20 tasks in one week', 3, 'Medium', GETDATE(), DATEADD(DAY, 7, GETDATE()), 'CountBased', '20', 250, 2, 1, 1, 5, GETDATE(), GETDATE()),
    ('Reading Marathon', 'Read 5 books in one month', 1, 'Easy', DATEADD(DAY, -10, GETDATE()), DATEADD(DAY, 20, GETDATE()), 'TargetBased', '5', 150, NULL, 1, 1, 5, GETDATE(), GETDATE()),
    ('Early Bird Challenge', 'Complete 5 habits before 8 AM for 5 days', 5, 'Medium', GETDATE(), DATEADD(DAY, 7, GETDATE()), 'HabitBased', '5', 175, 1, 1, 1, 5, GETDATE(), GETDATE());
GO

-- =============================================
-- 12. ChallengeParticipants (Depends on Challenges and Users)
-- =============================================
INSERT INTO ChallengeParticipants (ChallengeId, UserId, JoinDate, CurrentProgress, IsCompleted, CompletedAt, CreatedAt, UpdatedAt)
VALUES 
    -- John's challenge participations
    (1, 1, DATEADD(DAY, -3, GETDATE()), 5.0, 0, NULL, GETDATE(), GETDATE()),
    (2, 1, DATEADD(DAY, -5, GETDATE()), 8.0, 0, NULL, GETDATE(), GETDATE()),
    (3, 1, GETDATE(), 5.0, 0, NULL, GETDATE(), GETDATE()),
    
    -- Sarah's challenge participations
    (1, 2, DATEADD(DAY, -3, GETDATE()), 4.0, 0, NULL, GETDATE(), GETDATE()),
    (4, 2, DATEADD(DAY, -10, GETDATE()), 3.0, 0, NULL, GETDATE(), GETDATE()),
    
    -- Mike's challenge participations
    (3, 3, GETDATE(), 8.0, 0, NULL, GETDATE(), GETDATE()),
    (5, 3, GETDATE(), 3.0, 0, NULL, GETDATE(), GETDATE()),
    
    -- Emily's challenge participations
    (1, 4, DATEADD(DAY, -3, GETDATE()), 3.0, 0, NULL, GETDATE(), GETDATE()),
    (2, 4, DATEADD(DAY, -5, GETDATE()), 6.0, 0, NULL, GETDATE(), GETDATE());
GO

-- =============================================
-- 13. Quests (Depends on Users)
-- =============================================
INSERT INTO Quests (Title, Description, QuestType, RequirementType, RequirementValue, XPReward, StartDate, EndDate, IsPublished, IsActive, CreatedBy, CreatedAt, UpdatedAt)
VALUES 
    ('Daily Login', 'Log in to the app every day', 'Automatic', 'LoginBased', '7', 50, GETDATE(), DATEADD(DAY, 7, GETDATE()), 1, 1, 5, GETDATE(), GETDATE()),
    ('Habit Hero', 'Complete 10 habits in a week', 'Automatic', 'HabitCount', '10', 100, GETDATE(), DATEADD(DAY, 7, GETDATE()), 1, 1, 5, GETDATE(), GETDATE()),
    ('Task Warrior', 'Complete 5 high-priority tasks', 'Automatic', 'TaskBased', '5', 75, GETDATE(), DATEADD(DAY, 7, GETDATE()), 1, 1, 5, GETDATE(), GETDATE()),
    ('Social Butterfly', 'Join 3 challenges', 'Automatic', 'ChallengeJoin', '3', 80, GETDATE(), DATEADD(DAY, 14, GETDATE()), 1, 1, 5, GETDATE(), GETDATE()),
    ('Knowledge Seeker', 'Complete 5 quests', 'Automatic', 'QuestCount', '5', 150, GETDATE(), DATEADD(DAY, 30, GETDATE()), 1, 1, 5, GETDATE(), GETDATE()),
    ('Weekly Reflection', 'Write a journal entry every day for a week', 'Management', 'JournalCount', '7', 120, GETDATE(), DATEADD(DAY, 7, GETDATE()), 1, 1, 5, GETDATE(), GETDATE());
GO

-- =============================================
-- 14. QuestProgress (Depends on Quests and Users)
-- =============================================
INSERT INTO QuestProgress (QuestId, UserId, CurrentProgress, IsCompleted, CompletedAt, CreatedAt, UpdatedAt)
VALUES 
    -- John's quest progress
    (1, 1, 5.0, 0, NULL, GETDATE(), GETDATE()),
    (2, 1, 8.0, 0, NULL, GETDATE(), GETDATE()),
    (3, 1, 3.0, 0, NULL, GETDATE(), GETDATE()),
    
    -- Sarah's quest progress
    (1, 2, 4.0, 0, NULL, GETDATE(), GETDATE()),
    (2, 2, 6.0, 0, NULL, GETDATE(), GETDATE()),
    (6, 2, 3.0, 0, NULL, GETDATE(), GETDATE()),
    
    -- Mike's quest progress
    (1, 3, 6.0, 0, NULL, GETDATE(), GETDATE()),
    (3, 3, 4.0, 0, NULL, GETDATE(), GETDATE()),
    (4, 3, 2.0, 0, NULL, GETDATE(), GETDATE()),
    
    -- Emily's quest progress
    (1, 4, 3.0, 0, NULL, GETDATE(), GETDATE()),
    (2, 4, 5.0, 0, NULL, GETDATE(), GETDATE());
GO

-- =============================================
-- 15. UserAchievements (Depends on Users and Achievements)
-- =============================================
INSERT INTO UserAchievements (UserId, AchievementId, UnlockedAt)
VALUES 
    -- John's achievements
    (1, 1, DATEADD(DAY, -20, GETDATE())),
    (1, 2, DATEADD(DAY, -10, GETDATE())),
    (1, 3, DATEADD(DAY, -5, GETDATE())),
    
    -- Sarah's achievements
    (2, 1, DATEADD(DAY, -15, GETDATE())),
    (2, 7, DATEADD(DAY, -8, GETDATE())),
    
    -- Mike's achievements
    (3, 1, DATEADD(DAY, -25, GETDATE())),
    (3, 2, DATEADD(DAY, -12, GETDATE())),
    (3, 5, DATEADD(DAY, -7, GETDATE())),
    
    -- Emily's achievements
    (4, 1, DATEADD(DAY, -10, GETDATE()));
GO

-- =============================================
-- 16. XPTransactions (Depends on Users)
-- =============================================
INSERT INTO XPTransactions (UserId, Amount, SourceType, SourceId, Description, CreatedAt)
VALUES 
    -- John's XP transactions
    (1, 10, 'Habit', 1, 'Completed Morning Study', DATEADD(DAY, -6, GETDATE())),
    (1, 10, 'Habit', 1, 'Completed Morning Study', DATEADD(DAY, -5, GETDATE())),
    (1, 10, 'Habit', 1, 'Completed Morning Study', DATEADD(DAY, -4, GETDATE())),
    (1, 10, 'Habit', 1, 'Completed Morning Study', DATEADD(DAY, -3, GETDATE())),
    (1, 10, 'Habit', 1, 'Completed Morning Study', DATEADD(DAY, -2, GETDATE())),
    (1, 10, 'Habit', 1, 'Completed Morning Study', DATEADD(DAY, -1, GETDATE())),
    (1, 10, 'Habit', 1, 'Completed Morning Study', GETDATE()),
    (1, 50, 'Achievement', 1, 'Unlocked First Steps', DATEADD(DAY, -20, GETDATE())),
    (1, 100, 'Achievement', 2, 'Unlocked Task Master', DATEADD(DAY, -10, GETDATE())),
    (1, 150, 'Achievement', 3, 'Unlocked Streak Starter', DATEADD(DAY, -5, GETDATE())),
    (1, 10, 'Task', 4, 'Completed Buy Textbooks', DATEADD(DAY, -1, GETDATE())),
    
    -- Sarah's XP transactions
    (2, 10, 'Habit', 4, 'Completed Read Textbook', DATEADD(DAY, -4, GETDATE())),
    (2, 10, 'Habit', 4, 'Completed Read Textbook', DATEADD(DAY, -3, GETDATE())),
    (2, 10, 'Habit', 4, 'Completed Read Textbook', DATEADD(DAY, -2, GETDATE())),
    (2, 10, 'Habit', 4, 'Completed Read Textbook', DATEADD(DAY, -1, GETDATE())),
    (2, 10, 'Habit', 4, 'Completed Read Textbook', GETDATE()),
    (2, 50, 'Achievement', 1, 'Unlocked First Steps', DATEADD(DAY, -15, GETDATE())),
    (2, 80, 'Achievement', 7, 'Unlocked Journal Keeper', DATEADD(DAY, -8, GETDATE())),
    
    -- Mike's XP transactions
    (3, 10, 'Habit', 6, 'Completed Review Notes', DATEADD(DAY, -3, GETDATE())),
    (3, 10, 'Habit', 6, 'Completed Review Notes', DATEADD(DAY, -1, GETDATE())),
    (3, 50, 'Achievement', 1, 'Unlocked First Steps', DATEADD(DAY, -25, GETDATE())),
    (3, 100, 'Achievement', 2, 'Unlocked Task Master', DATEADD(DAY, -12, GETDATE())),
    (3, 75, 'Achievement', 5, 'Unlocked Challenge Accepted', DATEADD(DAY, -7, GETDATE())),
    
    -- Emily's XP transactions
    (4, 10, 'Habit', 8, 'Completed Lab Work', DATEADD(DAY, -2, GETDATE())),
    (4, 10, 'Habit', 8, 'Completed Lab Work', GETDATE()),
    (4, 50, 'Achievement', 1, 'Unlocked First Steps', DATEADD(DAY, -10, GETDATE()));
GO

-- =============================================
-- 17. JournalEntries (Depends on Users)
-- =============================================
INSERT INTO JournalEntries (UserId, Title, Content, Mood, Tags, CreatedAt, UpdatedAt)
VALUES 
    -- John's journal entries
    (1, 'Productive Day', 'Had a great study session today. Completed all planned tasks and even got ahead on physics. Feeling confident about the upcoming quiz.', 'Happy', 'study,productive,physics', DATEADD(DAY, -1, GETDATE()), GETDATE()),
    (1, 'Weekly Reflection', 'This week went well. Maintained my study streak and exercise routine. Need to work on time management for the next week.', 'Reflective', 'weekly,reflection,goals', GETDATE(), GETDATE()),
    
    -- Sarah's journal entries
    (2, 'Reading Progress', 'Finished another psychology book. The section on cognitive behavioral therapy was particularly interesting. Taking notes for future reference.', 'Inspired', 'reading,psychology,learning', DATEADD(DAY, -2, GETDATE()), GETDATE()),
    (2, 'Meditation Benefits', 'Been meditating daily for a week now. Notice I feel calmer and more focused during study sessions. Will continue this habit.', 'Calm', 'meditation,wellness,mindfulness', DATEADD(DAY, -5, GETDATE()), GETDATE()),
    (2, 'Research Paper Ideas', 'Have several good ideas for my research paper. Need to narrow down the topic and start drafting the outline.', 'Excited', 'research,paper,academic', GETDATE(), GETDATE()),
    
    -- Mike's journal entries
    (3, 'Networking Success', 'Connected with two alumni today. Both were very helpful and gave great advice about the industry. One even offered to review my resume.', 'Optimistic', 'networking,career,alumni', DATEADD(DAY, -3, GETDATE()), GETDATE()),
    (3, 'Application Update', 'Submitted 3 more internship applications today. Total count now at 12. Need to reach 20 by the deadline.', 'Determined', 'internship,applications,career', GETDATE(), GETDATE()),
    
    -- Emily's journal entries
    (4, 'Lab Interest', 'Attended a seminar today on molecular biology research. Very interested in joining Professor Smith''s lab. Will email them tomorrow.', 'Curious', 'lab,research,biology', DATEADD(DAY, -1, GETDATE()), GETDATE());
GO

-- =============================================
-- 18. Notes (Depends on Users)
-- =============================================
INSERT INTO Notes (UserId, Title, Content, Category, IsPinned, CreatedAt, UpdatedAt)
VALUES 
    -- John's notes
    (1, 'Math Formulas', 'Key formulas for calculus: 
- Derivative rules
- Integration techniques
- Chain rule applications
Need to memorize these for the midterm.', 'Academic', 1, DATEADD(DAY, -5, GETDATE()), GETDATE()),
    (1, 'Study Schedule', 'Weekly study plan:
Mon-Wed: Math and Physics
Thu-Fri: Computer Science
Sat: Review and practice
Sun: Rest and planning', 'Planning', 1, DATEADD(DAY, -10, GETDATE()), GETDATE()),
    (1, 'Python Resources', 'Useful Python learning resources:
- Codecademy course
- LeetCode for practice
- Stack Overflow for help
- Official Python documentation', 'Resources', 0, DATEADD(DAY, -7, GETDATE()), GETDATE()),
    
    -- Sarah's notes
    (2, 'Psychology Terms', 'Important terms to remember:
- Cognitive dissonance
- Classical conditioning
- Operant conditioning
- Social learning theory', 'Academic', 1, DATEADD(DAY, -8, GETDATE()), GETDATE()),
    (2, 'Book List', 'Books to read this year:
1. Thinking, Fast and Slow
2. The Power of Habit
3. Grit
4. Mindset
5. Atomic Habits', 'Personal', 0, DATEADD(DAY, -15, GETDATE()), GETDATE()),
    
    -- Mike's notes
    (3, 'Interview Tips', 'Key interview preparation:
- Research the company
- Practice common questions
- Prepare STAR stories
- Ask thoughtful questions
- Follow up with thank you note', 'Career', 1, DATEADD(DAY, -12, GETDATE()), GETDATE()),
    (3, 'Resume Points', 'Resume improvements needed:
- Add recent project experience
- Quantify achievements
- Include relevant skills
- Fix formatting issues', 'Career', 0, DATEADD(DAY, -6, GETDATE()), GETDATE()),
    
    -- Emily's notes
    (4, 'Research Topics', 'Potential research areas:
- Molecular biology
- Genetics
- Cell biology
- Biochemistry
Need to discuss with advisor.', 'Academic', 1, DATEADD(DAY, -4, GETDATE()), GETDATE()),
    (4, 'Course Notes', 'Biology 101 key concepts:
- Cell structure and function
- DNA replication
- Protein synthesis
- Cellular respiration', 'Academic', 0, DATEADD(DAY, -9, GETDATE()), GETDATE());
GO

-- =============================================
-- 19. Notifications (Depends on Users)
-- =============================================
INSERT INTO Notifications (UserId, Type, Title, Message, RelatedEntityId, IsRead, CreatedAt)
VALUES 
    -- John's notifications
    (1, 'Achievement', 'Achievement Unlocked!', 'Congratulations! You unlocked the Streak Starter achievement.', 3, 0, DATEADD(DAY, -5, GETDATE())),
    (1, 'Task', 'Task Due Soon', 'Your task "Complete Math Assignment" is due in 2 days.', 1, 0, DATEADD(DAY, -1, GETDATE())),
    (1, 'Habit', 'Streak Milestone', 'Amazing! You''ve maintained a 12-day streak on Morning Study.', 1, 1, GETDATE()),
    (1, 'Challenge', 'Challenge Update', 'You''re making great progress on the 7-Day Study Streak challenge! Keep it up.', 1, 0, GETDATE()),
    
    -- Sarah's notifications
    (2, 'Achievement', 'Achievement Unlocked!', 'Congratulations! You unlocked the Journal Keeper achievement.', 7, 0, DATEADD(DAY, -8, GETDATE())),
    (2, 'Goal', 'Goal Milestone', 'You completed your "Complete 3 Books" milestone!', 3, 1, DATEADD(DAY, -15, GETDATE())),
    (2, 'Quest', 'Quest Progress', 'You''ve completed 3 out of 7 daily logins for the Daily Login quest.', 1, 0, GETDATE()),
    
    -- Mike's notifications
    (3, 'Achievement', 'Achievement Unlocked!', 'Congratulations! You unlocked the Challenge Accepted achievement.', 5, 0, DATEADD(DAY, -7, GETDATE())),
    (3, 'Task', 'Task Reminder', 'Don''t forget to update your resume today.', 7, 0, GETDATE()),
    (3, 'Challenge', 'Challenge Update', 'You''re at 8/20 tasks for the Task Master Week challenge.', 3, 1, GETDATE()),
    
    -- Emily's notifications
    (4, 'Habit', 'Streak Alert', 'Your Lab Work habit is on a 4-day streak. Keep going!', 8, 0, GETDATE()),
    (4, 'Task', 'Task Due Soon', 'Remember to contact Professor Smith about research opportunities.', 10, 0, DATEADD(DAY, -1, GETDATE()));
GO

-- =============================================
-- Verification Queries
-- =============================================
PRINT 'Demo data insertion completed!';
PRINT 'Verifying record counts...';

SELECT 'Categories' AS TableName, COUNT(*) AS RecordCount FROM Categories
UNION ALL
SELECT 'Users', COUNT(*) FROM Users
UNION ALL
SELECT 'Levels', COUNT(*) FROM Levels
UNION ALL
SELECT 'Habits', COUNT(*) FROM Habits
UNION ALL
SELECT 'HabitLogs', COUNT(*) FROM HabitLogs
UNION ALL
SELECT 'Goals', COUNT(*) FROM Goals
UNION ALL
SELECT 'GoalMilestones', COUNT(*) FROM GoalMilestones
UNION ALL
SELECT 'Tasks', COUNT(*) FROM Tasks
UNION ALL
SELECT 'Challenges', COUNT(*) FROM Challenges
UNION ALL
SELECT 'ChallengeParticipants', COUNT(*) FROM ChallengeParticipants
UNION ALL
SELECT 'Quests', COUNT(*) FROM Quests
UNION ALL
SELECT 'QuestProgress', COUNT(*) FROM QuestProgress
UNION ALL
SELECT 'Achievements', COUNT(*) FROM Achievements
UNION ALL
SELECT 'UserAchievements', COUNT(*) FROM UserAchievements
UNION ALL
SELECT 'XPTransactions', COUNT(*) FROM XPTransactions
UNION ALL
SELECT 'JournalEntries', COUNT(*) FROM JournalEntries
UNION ALL
SELECT 'Notes', COUNT(*) FROM Notes
UNION ALL
SELECT 'Notifications', COUNT(*) FROM Notifications
ORDER BY TableName;

GO

PRINT 'Demo data script execution complete!';
