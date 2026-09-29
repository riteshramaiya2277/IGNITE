# IGNITE — Implementation Plan



> **Purpose:** GitHub root-level implementation roadmap for the IGNITE college project.
>
> **Target:** ASP.NET Web Forms + SQL Server, with a practical architecture that is achievable for the college submission while remaining extendable toward a production-style application.
>
> **UI status:** The IGNITE UI/Figma design is already available/finalized. This document focuses on architecture, data, implementation flow, security, and development order rather than redesigning the UI.

---

## 1. Confirmed Technical Decisions

| Area | Decision |
|---|---|
| Web technology | ASP.NET Web Forms |
| IDE | Latest Visual Studio available in the project environment |
| Database | SQL Server |
| Data access | Hybrid: primarily stored procedures, with simple direct SQL/ADO.NET reads where useful |
| Authentication | Custom `Users` table |
| Password storage | C# salted password hashing; never plain text |
| Login state | Forms Authentication cookie + Session |
| Roles | Student, Management |
| Page architecture | `.aspx` + `.aspx.cs` code-behind |
| Master Pages | Separate Student and Management Master Pages |
| Architecture | Simple Web Forms architecture; no mandatory BLL/DAL/repository layer |
| Database design | Normalized relational design, but not over-engineered |
| Authorization | Explicit code-behind checks on protected pages |
| Gamification | Hybrid C# + SQL/stored procedures |
| Release target | College MVP first, structured so it can evolve toward production |

### Core application architecture

```text
                ASP.NET Web Forms
                       |
          +------------+------------+
          |                         |
 StudentMaster.master       ManagementMaster.master
          |                         |
     Student Pages            Management Pages
          |                         |
       .aspx.cs                  .aspx.cs
          |                         |
          +------------+------------+
                       |
             ADO.NET / Stored Procedures
                       |
                    SQL Server
```

Keep the implementation simple. Do not introduce unnecessary frameworks or architectural layers unless a later requirement clearly needs them.

---

# 2. Product Scope

IGNITE is a habit, productivity, goal, challenge, and gamification platform for college students.

### Student capabilities

- Dashboard
- Habits
- Tasks
- Goals
- Challenges
- Journal & Notes
- Profile / Settings
- XP / levels / titles
- Streaks
- Achievements
- Quests
- Notifications
- Personal progress information

### Management capabilities

- Management Dashboard
- Students
- Challenges
- Quests
- Achievements
- Categories
- Settings
- Student monitoring
- Student account deactivation

### Privacy rule

Management must **not** access student:

- Journal entries
- Private notes

---

# 3. Student Navigation

The Student Master Page already has a UI and should expose:

1. Dashboard
2. Habits
3. Tasks
4. Goals
5. Challenges
6. Journal & Notes
7. Profile / Settings

There is **no global Quick Add**.

There are also no separate top-level Calendar or Progress navigation items in the confirmed student navigation. Relevant deadline/progress information should be surfaced from the appropriate existing pages.

Use the existing UI rather than redesigning the navigation during implementation.

---

# 4. Management Navigation

The Management Master Page uses a **sidebar** containing:

1. Dashboard
2. Students
3. Challenges
4. Quests
5. Achievements
6. Categories
7. Settings

Management uses its own Master Page so its navigation and authorization remain separated from Student pages.

---

# 5. Authentication Architecture

Authentication is custom rather than ASP.NET Identity.

## Users table

The application maintains its own `Users` table.

Recommended fields:

```text
UserId
FullName
Email / Username
PasswordHash
Role
College
Course
Year
Semester
AcademicGoals
TotalXP
CurrentLevelId
CurrentTitleId
IsActive
CreatedAt
UpdatedAt
```

Do not store passwords directly.

## Registration

```text
Register
   ↓
Validate input
   ↓
Check duplicate account
   ↓
Hash password in C#
   ↓
Insert User through database operation
   ↓
Create default Student role
   ↓
Continue to onboarding
```

## Login

```text
Login
  ↓
Find user
  ↓
Verify password hash
  ↓
Check IsActive
  ↓
Create Forms Authentication cookie
  ↓
Store UserId + Role in Session
  ↓
Redirect by Role
```

Management accounts should be created/seeded securely rather than allowing normal public registration to choose the Management role.

---

# 6. Authorization

Authorization will use explicit code-behind checks.

Every protected page should check:

1. Is the user authenticated?
2. Is the user active?
3. Does the user have the required role?
4. For student-owned records, does the requested record belong to the current user?

Example flow:

```text
Page_Load
   ↓
Authenticated?
 ├── No → Login
 └── Yes
      ↓
Correct Role?
 ├── No → Unauthorized
 └── Yes
      ↓
Ownership check where required
      ↓
Load page
```

Never trust a URL parameter such as `?id=123` without verifying ownership.

---

# 7. Password Security

Use C# password hashing with a unique salt.

Conceptually:

```text
Password
   ↓
C# hashing algorithm
   ↓
Salt + Hash
   ↓
SQL Server
```

At login:

```text
Entered Password
      ↓
Hash using stored salt
      ↓
Compare with stored hash
```

Never:

- Store plain-text passwords
- Log passwords
- Return password hashes to the UI
- Put passwords in source code
- Put passwords in Git

---

# 8. Database Architecture

Use a normalized relational SQL Server database.

The goal is proper relationships without unnecessary enterprise-level complexity.

## Core tables

```text
Users
Categories

Habits
HabitLogs

Tasks

Goals
GoalMilestones

Challenges
ChallengeParticipants

Quests
QuestProgress

Achievements
UserAchievements

XPTransactions
Levels
Titles

JournalEntries
Notes
Notifications
```

Additional supporting tables may be introduced only when required by implementation.

---

# 9. Core Relationships

```text
Users
 ├── Habits
 │    └── HabitLogs
 │
 ├── Tasks
 │
 ├── Goals
 │    └── GoalMilestones
 │
 ├── ChallengeParticipants
 │    └── Challenges
 │
 ├── QuestProgress
 │    └── Quests
 │
 ├── UserAchievements
 │    └── Achievements
 │
 ├── XPTransactions
 ├── JournalEntries
 ├── Notes
 └── Notifications
```

Categories can be referenced by habits, challenges and other relevant entities.

Use:

- Primary keys
- Foreign keys
- Appropriate indexes
- `NOT NULL` where required
- Unique constraints for account identifiers
- Check constraints where useful

---

# 10. Data Access Strategy

The application will use a hybrid SQL approach.

## Preferred

Use stored procedures for:

- Create/update/delete operations
- Authentication-related database operations
- Habit completion
- Task completion
- Goal updates
- Challenge participation
- Challenge completion
- Quest progress
- XP transactions
- Achievement unlocks
- Important multi-step operations

## Allowed

Simple direct ADO.NET queries may be used where they make a straightforward read significantly simpler.

Example:

```text
.aspx.cs
   ↓
SqlConnection
   ↓
SqlCommand
   ↓
Stored Procedure OR simple parameterized SQL
   ↓
SQL Server
```

Never concatenate untrusted user input into SQL.

Always use parameters.

---

# 11. Stored Procedure Naming Convention

Use a consistent naming convention.

Examples:

```text
sp_User_Login
sp_User_Register
sp_User_GetById

sp_Habit_GetByUser
sp_Habit_Create
sp_Habit_Update
sp_Habit_Delete
sp_Habit_LogCompletion

sp_Task_GetByUser
sp_Task_Create
sp_Task_Update
sp_Task_Delete
sp_Task_Complete

sp_Goal_GetByUser
sp_Goal_Create
sp_Goal_Update
sp_Goal_Complete

sp_Challenge_GetAvailable
sp_Challenge_Join
sp_Challenge_GetProgress
sp_Challenge_UpdateProgress

sp_Quest_GetActive
sp_Quest_UpdateProgress

sp_Achievement_GetForUser
sp_Achievement_Unlock

sp_XP_AddTransaction
sp_XP_GetUserTotal
```

Exact procedure names can change during implementation, but the convention should remain consistent.

---

# 12. Habit Module

## Habit types

Support:

- Binary
- Measurable

### Binary

Example:

```text
Read for 30 minutes
Completed = Yes / No
```

### Measurable

Example:

```text
Study
Target = 3
Unit = hours
Actual = 2.5
```

## Frequency

Support:

- Daily
- Selected days
- Weekly
- Custom

## Habit lifecycle

```text
Active
  ↓
Paused
  ↓
Archived
```

Historical logs should remain available.

---

# 13. Habit Completion and Streaks

### Binary

```text
Habit
 ↓
Mark Complete
 ↓
Create HabitLog
 ↓
XP calculation
 ↓
Streak update
 ↓
Achievement check
 ↓
Quest check
```

### Measurable

```text
Enter actual value
      ↓
Calculate progress %
      ↓
Target reached?
 ├── No → Save partial progress
 └── Yes
      ↓
Complete habit
      ↓
XP + streak + checks
```

### Streak rule

Only scheduled days matter.

Example:

```text
Mon  scheduled → completed
Tue  not scheduled
Wed  scheduled → completed
Thu  scheduled → completed
Fri  scheduled → missed
```

Friday breaks the streak.

Do not treat an unscheduled day as a missed habit.

---

# 14. Task Module

Task lifecycle:

```text
Pending
   ↓
In Progress
   ↓
Completed
```

If the due date passes before completion:

```text
Pending/In Progress
       ↓
     Overdue
```

Task data:

```text
TaskId
UserId
GoalId (optional)
Title
Description
DueDate
Priority
CategoryId / Subject
Status
XPReward
CompletedAt
CreatedAt
```

XP rule:

```text
Completed on time → Full XP
Completed overdue → Reduced XP
```

The exact reduced-XP value should be configurable rather than hard-coded in multiple pages.

---

# 15. SMART Goals

Each goal supports:

```text
Specific
Measurable
Achievable
Relevant
Time-bound
```

Recommended fields:

```text
GoalId
UserId
Title
Specific
Measurable
Achievable
Relevant
TimeBound
TargetValue
CurrentValue
StartDate
EndDate
Status
XPReward
```

Goals may contain milestones.

```text
Goal
 ↓
Milestones
 ↓
Tasks (optional relationship)
 ↓
Progress
 ↓
Goal completed
 ↓
XP
 ↓
Achievement / Quest checks
```

---

# 16. Challenges

Only Management creates/publishes system challenges.

## Management flow

```text
Create Challenge
      ↓
Title / Description
      ↓
Category
      ↓
Difficulty
      ↓
Start / End Date
      ↓
Requirement Type
      ↓
Requirement Value
      ↓
XP Reward
      ↓
Optional Achievement
      ↓
Publish
```

## Student flow

```text
Browse Challenges
      ↓
View Details
      ↓
Join
      ↓
Track Progress
      ↓
Requirement achieved
      ↓
Complete
      ↓
XP + achievement/badge
```

Requirement types:

- Habit-based
- Count-based
- Target-based

### Category concurrency

A student can participate in challenges from different categories, but only one active challenge should exist per category where the requirement specifies that limit.

Enforce this in the server-side/business flow and database-safe operation.

---

# 17. Quests

Quests have two sources.

### Automatic quests

```text
Student Activity
      ↓
Quest Rule
      ↓
Daily / Weekly Quest
      ↓
Progress
      ↓
Complete
      ↓
XP
```

### Management-created quests

```text
Management
      ↓
Create Quest
      ↓
Publish
      ↓
Students receive it
      ↓
Progress
      ↓
Complete
      ↓
XP
```

Keep automatic quest generation separate from page code so quest rules can be changed later.

---

# 18. Gamification

Core entities:

```text
XPTransactions
Levels
Titles
Achievements
UserAchievements
```

## XP flow

```text
Productive Action
      ↓
.aspx.cs identifies event
      ↓
Determine XP
      ↓
SQL operation creates XP transaction
      ↓
Update/recalculate user XP
      ↓
Check level
      ↓
Check title
      ↓
Check achievement
      ↓
Check quest
```

Use XP transactions as history rather than relying only on a single total.

Example:

```text
XPTransactions
----------------------------
UserId
Amount
SourceType
SourceId
Description
CreatedAt
```

This makes XP history auditable and easier to debug.

---

# 19. Levels and Titles

Example structure:

```text
Level 1 → required XP
Level 2 → required XP
Level 3 → required XP
...
```

When XP changes:

```text
Current XP
    ↓
Find highest unlocked level
    ↓
Update CurrentLevel
    ↓
Determine Title
    ↓
Update CurrentTitle
```

Do not hard-code level thresholds in multiple `.aspx.cs` pages.

Store them in the database.

---

# 20. Achievements

Support:

- Milestone achievements
- Challenge achievements
- Hidden achievements

Flow:

```text
Activity
   ↓
Achievement check
   ↓
Condition met?
 ├── No → Nothing
 └── Yes
      ↓
Create UserAchievement
      ↓
Award achievement XP if configured
      ↓
Notification
```

Hidden achievements should not reveal their condition before unlock.

Prevent duplicate achievement unlocks with a unique user/achievement relationship.

---

# 21. Journal and Notes

Journal and Notes are private.

### Journal

```text
Create
 ↓
Save
 ↓
View own history
 ↓
Edit/Delete own entry
```

### Notes

```text
Create
 ↓
Save
 ↓
View own notes
 ↓
Edit/Delete own note
```

Ownership rule:

```text
Current UserId == Record.UserId
```

Management pages must never query or display these tables.

---

# 22. Notifications

Initial notification system should be in-app.

Support:

- Upcoming task deadline
- Upcoming goal deadline
- Habit streak at risk
- Weekly progress summary
- Achievement unlocked
- Challenge completed
- Level up

Suggested fields:

```text
NotificationId
UserId
Type
Title
Message
RelatedEntityId
IsRead
CreatedAt
```

Email/push notifications are optional future extensions, not required for the first MVP.

---

# 23. Student Dashboard

The dashboard should answer:

> **What should I focus on today?**

Display existing designed UI for:

- Today's habits
- Today's tasks
- Active challenges
- Daily/weekly quests
- Current streak
- Important deadlines
- XP / level status
- Motivational information
- Relevant progress

Do not turn it into an oversized analytics dashboard.

---

# 24. Management Dashboard

The management dashboard should provide platform-level information useful for administration.

Possible information:

- Total active students
- Active challenges
- Active quests
- Achievement activity
- Student account status
- Recent platform activity

Avoid exposing private Journal/Notes data.

---

# 25. Management — Students

Management can:

- Search students
- View student profile information
- View level/XP
- View streak information
- View challenges
- View achievements
- Deactivate student account

Management cannot:

- View Journal
- View Notes
- Modify private student content

Student deactivation should update `IsActive` rather than immediately deleting historical records.

---

# 26. Management — Challenges

Management can:

- Create
- Edit
- Publish
- Unpublish/deactivate
- View challenge participation
- Configure requirements
- Configure rewards

Students can only interact with published/available challenges.

---

# 27. Management — Quests

Management can:

- Create quest
- Configure requirement
- Configure XP
- Set active period
- Publish/deactivate

Automatic quests remain system-generated.

---

# 28. Management — Achievements

Management can manage:

- Name
- Description
- Icon
- Requirement type
- Requirement value
- XP reward
- Hidden/visible state
- Active state

Achievement unlocks are controlled by the system, not manually awarded through normal UI unless a future requirement explicitly adds that capability.

---

# 29. Categories

Categories are reusable system data.

Initial categories can include:

```text
Study
Health
Career
Digital Wellbeing
```

Management can create/update/deactivate categories if the finalized UI/requirements allow it.

Avoid deleting categories that are referenced by historical records. Prefer inactive/deactivated state.

---

# 30. Profile and Settings

Student profile should support the existing UI and include appropriate:

- Personal information
- College
- Course
- Year/Semester
- Academic goals
- XP/level/title
- Account settings
- Password change
- Logout
- Account deletion

Do not expose password hashes.

---

# 31. Page Structure

Suggested project structure:

```text
IGNITE/
│
├── Account/
│   ├── Login.aspx
│   ├── Login.aspx.cs
│   ├── Register.aspx
│   └── Register.aspx.cs
│
├── Student/
│   ├── StudentMaster.master
│   ├── StudentMaster.master.cs
│   ├── Dashboard.aspx
│   ├── Habits.aspx
│   ├── Tasks.aspx
│   ├── Goals.aspx
│   ├── Challenges.aspx
│   ├── JournalNotes.aspx
│   └── Profile.aspx
│
├── Management/
│   ├── ManagementMaster.master
│   ├── ManagementMaster.master.cs
│   ├── Dashboard.aspx
│   ├── Students.aspx
│   ├── Challenges.aspx
│   ├── Quests.aspx
│   ├── Achievements.aspx
│   ├── Categories.aspx
│   └── Settings.aspx
│
├── Models/
├── Helpers/
├── SQL/
│   ├── Tables/
│   ├── StoredProcedures/
│   └── Seed/
│
├── Content/
├── Scripts/
├── Images/
├── Web.config
└── Global.asax
```

The exact folders can be adjusted to match the existing Visual Studio project.

---

# 32. Helpers

Even though the project is intentionally simple, a small `Helpers` folder is useful.

Recommended helpers:

```text
AuthHelper
PasswordHelper
DatabaseHelper
ValidationHelper
GamificationHelper
```

These should stay small.

Do not turn the helpers folder into a hidden replacement for a full service layer.

---

# 33. Global Application Behavior

Use `Global.asax` for application-level Web Forms behavior where needed.

Potential responsibilities:

- Application start
- Session start
- Global error handling
- Authentication-related global behavior if needed

Do not put feature-specific business logic into `Global.asax`.

---

# 34. Web.config

Store environment-specific database configuration securely.

Conceptually:

```xml
<connectionStrings>
    <add name="IGNITEConnection"
         connectionString="..."
         providerName="System.Data.SqlClient" />
</connectionStrings>
```

Do not commit production credentials.

For local development, use a safe local connection configuration.

---

# 35. Validation

Validate:

- Required fields
- Email/username format
- Password requirements
- Numeric values
- Dates
- Goal ranges
- Habit targets
- Challenge requirements
- Quest requirements

Use Web Forms validation controls where appropriate, but always validate again in code-behind/server-side logic.

---

# 36. Security Checklist

Before final submission:

- [ ] Passwords are hashed
- [ ] No plain-text passwords
- [ ] SQL parameters are used
- [ ] Authentication cookie is configured
- [ ] Session is validated
- [ ] Role checks exist
- [ ] Ownership checks exist
- [ ] Management pages are protected
- [ ] Student private data is protected
- [ ] Journal/Notes are never exposed to Management
- [ ] Account deactivation blocks login
- [ ] Sensitive configuration is not committed
- [ ] Error messages do not expose database details
- [ ] HTTPS is used where deployed
- [ ] Anti-forgery protections are used for sensitive operations where appropriate

---

# 37. Error Handling

Implement simple, user-friendly error handling.

Examples:

```text
Database error
    ↓
Log technical details
    ↓
Show friendly error message
```

Do not display:

- SQL queries
- Connection strings
- Stack traces
- Password information
- Internal database details

Create appropriate:

- Unauthorized page
- Not Found page
- Generic Error page

---

# 38. Implementation Order

## Phase 1 — Project Foundation

1. Create ASP.NET Web Forms project
2. Configure SQL Server connection
3. Create database
4. Create tables
5. Create initial stored procedures
6. Create Student Master Page
7. Create Management Master Page
8. Configure common CSS/JS references
9. Create basic folder structure

## Phase 2 — Authentication

1. Users table
2. Password hashing helper
3. Registration
4. Login
5. Forms Authentication
6. Session setup
7. Role checks
8. Logout
9. Account deactivation behavior

## Phase 3 — Student Core

1. Dashboard
2. Categories
3. Habits
4. Habit logs
5. Streaks
6. Tasks
7. Goals
8. Goal milestones
9. Journal
10. Notes
11. Profile

## Phase 4 — Gamification

1. XP transactions
2. Levels
3. Titles
4. Achievement definitions
5. User achievements
6. XP integration
7. Streak integration
8. Achievement checks
9. Level-up checks

## Phase 5 — Challenges and Quests

1. Challenge management
2. Challenge browsing
3. Challenge joining
4. Challenge progress
5. Challenge completion
6. Quest definitions
7. Automatic quests
8. Management quests
9. Quest progress

## Phase 6 — Management

1. Management dashboard
2. Student management
3. Challenge management
4. Quest management
5. Achievement management
6. Category management
7. Settings

## Phase 7 — Notifications and Polish

1. Notifications
2. Empty states
3. Validation states
4. Error states
5. Responsive verification
6. Authorization testing
7. Data integrity testing
8. Final UI integration
9. Deployment preparation

---

# 39. Testing Strategy

Because this is a college MVP, prioritize practical testing over excessive test infrastructure.

## Authentication tests

- Register valid user
- Reject duplicate user
- Reject invalid password
- Login valid user
- Reject invalid login
- Block inactive user
- Logout
- Role redirect

## Habit tests

- Create habit
- Edit habit
- Delete/archive habit
- Complete binary habit
- Log measurable habit
- Calculate completion
- Verify streak
- Verify missed scheduled day resets streak

## Task tests

- Create task
- Update task
- Complete on time
- Complete overdue
- Verify XP behavior

## Goal tests

- Create SMART goal
- Add milestone
- Update progress
- Complete goal

## Challenge tests

- Publish challenge
- Join challenge
- Prevent invalid duplicate category participation
- Update progress
- Complete challenge
- Award reward

## Quest tests

- Generate quest
- Display active quest
- Update progress
- Complete quest

## Gamification tests

- XP transaction
- Level change
- Title change
- Achievement unlock
- Prevent duplicate achievement

## Privacy tests

- Student A cannot access Student B's records
- Management cannot access Journal
- Management cannot access Notes
- Student cannot access Management pages

---

# 40. GitHub Development Strategy

Use small commits.

Examples:

```text
init: create Web Forms project
feat: add SQL Server database
feat: add custom authentication
feat: add student and management master pages
feat: implement student dashboard
feat: implement habits
feat: implement habit streaks
feat: implement tasks
feat: implement SMART goals
feat: implement XP system
feat: implement achievements
feat: implement challenges
feat: implement quests
feat: implement journal and notes
feat: implement management students
feat: implement management challenges
feat: implement management quests
feat: implement management achievements
feat: implement categories
feat: implement notifications
test: verify authentication and authorization
fix: resolve ownership validation
style: integrate finalized IGNITE UI
```

Avoid committing:

```text
*.user
passwords
API keys
production connection strings
private test data
```

---

# 41. College MVP vs Future Production Extension

The first version should remain simple enough to finish and demonstrate.

### MVP priorities

```text
Authentication
   ↓
Student/Management roles
   ↓
Habits
   ↓
Tasks
   ↓
Goals
   ↓
Challenges
   ↓
Gamification
   ↓
Journal/Notes
   ↓
Management
```

### Future extension points

The architecture should leave room for:

- API layer
- Mobile client
- Email/push notifications
- More granular permissions
- Background jobs
- Caching
- Advanced analytics
- Automated scheduled quest generation
- More scalable service/repository architecture
- Stronger automated testing
- Cloud deployment

Do not implement these future systems unless the project scope expands.

---

# 42. Definition of Done

A feature is considered complete when:

- [ ] Required SQL table exists
- [ ] Required foreign keys/constraints exist
- [ ] Required stored procedures exist
- [ ] `.aspx` UI is connected to existing design
- [ ] `.aspx.cs` logic works
- [ ] Input validation exists
- [ ] Authentication/authorization is checked
- [ ] Ownership is checked where applicable
- [ ] Database errors are handled
- [ ] Empty state is handled
- [ ] Main success flow works
- [ ] Related XP/streak/achievement behavior works where applicable
- [ ] Tested with realistic data
- [ ] Git commit created

---

# 43. Recommended First Implementation Task

Do not start by implementing every page.

Start with this vertical slice:

```text
SQL Server
   ↓
Users table
   ↓
Register
   ↓
Login
   ↓
Forms Authentication + Session
   ↓
Role check
   ↓
Student Dashboard
   ↓
Student Master Page
```

Once authentication and role separation work, build one complete feature end-to-end:

```text
Habit
 ↓
Create
 ↓
Display
 ↓
Complete
 ↓
HabitLog
 ↓
XP
 ↓
Streak
```

Then repeat the same pattern for Tasks, Goals, Challenges and Quests.

This reduces the risk of creating many UI pages that are not actually connected to the database.

---

# 44. Final Architecture Summary

```text
                    IGNITE
                      |
             ASP.NET Web Forms
                      |
          +-----------+-----------+
          |                       |
     STUDENT                    MANAGEMENT
          |                       |
 StudentMaster.master     ManagementMaster.master
          |                       |
       .aspx.cs                 .aspx.cs
          |                       |
          +-----------+-----------+
                      |
                ADO.NET Layer
                      |
        +-------------+-------------+
        |                           |
 Stored Procedures            Simple SQL Reads
        |                           |
        +-------------+-------------+
                      |
                  SQL Server
                      |
        +-------------+-------------+
        |             |             |
      Users        Core Data    Gamification
                     |             |
              Habits/Tasks      XP/Levels
              Goals/Challenges  Titles/Achievements
              Quests            Progress
              Journal/Notes
```

## Guiding principle

> **Keep the implementation simple enough to finish, structured enough to understand, and clean enough to extend.**

The existing IGNITE UI should drive the presentation layer; this document defines how that UI connects to authentication, code-behind, SQL Server, stored procedures, business rules, gamification, privacy, and management functionality.