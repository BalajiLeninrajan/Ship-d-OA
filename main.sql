CREATE TABLE IF NOT EXISTS Users (
    UserID INTEGER PRIMARY KEY AUTOINCREMENT,
    Username VARCHAR(255) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    SignUpDate DATETIME NOT NULL,
    Status TEXT CHECK(Status IN ('ACTIVE', 'SUSPENDED', 'DELETED')) NOT NULL
);

CREATE TABLE IF NOT EXISTS Content (
    ContentID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER NOT NULL,
    ContentType TEXT CHECK(ContentType IN ('POST', 'COMMENT', 'IMAGE', 'VIDEO')) NOT NULL,
    ContentBody TEXT,
    PostDate DATETIME NOT NULL,
    Status TEXT CHECK(Status IN ('ACTIVE', 'REVIEW', 'REMOVED', 'ARCHIVED')) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE IF NOT EXISTS Reports (
    ReportID INTEGER PRIMARY KEY AUTOINCREMENT,
    ReportedContentID INTEGER NOT NULL,
    ReportingUserID INTEGER NOT NULL,
    ReportDate DATETIME NOT NULL,
    Reason TEXT CHECK(Reason IN ('SPAM', 'HARASSMENT', 'INAPPROPRIATE', 'COPYRIGHT')) NOT NULL,
    Status TEXT CHECK(Status IN ('OPEN', 'CLOSED', 'ESCALATED')) NOT NULL,
    FOREIGN KEY (ReportedContentID) REFERENCES Content(ContentID),
    FOREIGN KEY (ReportingUserID) REFERENCES Users(UserID)
);

CREATE TABLE IF NOT EXISTS Moderators (
    ModeratorID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER UNIQUE NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE IF NOT EXISTS ModerationActions (
    ActionID INTEGER PRIMARY KEY AUTOINCREMENT,
    ReportID INTEGER NOT NULL,
    ModeratorID INTEGER NOT NULL,
    ActionType TEXT CHECK(ActionType IN ('REVIEWED', 'REMOVED', 'IGNORED', 'ESCALATED')) NOT NULL,
    ActionDate DATETIME NOT NULL,
    Notes TEXT,
    FOREIGN KEY (ReportID) REFERENCES Reports(ReportID),
    FOREIGN KEY (ModeratorID) REFERENCES Moderators(ModeratorID)
);

CREATE TABLE IF NOT EXISTS Appeals (
    AppealID INTEGER PRIMARY KEY AUTOINCREMENT,
    ContentID INTEGER NOT NULL,
    UserID INTEGER NOT NULL,
    AppealDate DATETIME NOT NULL,
    Reason TEXT NOT NULL,
    Status TEXT CHECK(Status IN ('OPEN', 'DENIED', 'GRANTED')) NOT NULL,
    FOREIGN KEY (ContentID) REFERENCES Content(ContentID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Users (Username, Email, SignUpDate, Status) VALUES
('AlexSmith', 'alex.smith@example.com', '2023-04-01', 'ACTIVE'),
('Jamie_K', 'jamie.k@example.com', '2023-04-02', 'ACTIVE'),
('ChrisPine', 'chris.pine@example.com', '2023-04-03', 'ACTIVE'),
('SammyRay', 'sammy.ray@example.com', '2023-04-04', 'SUSPENDED'),
('Morgan_Freeman', 'morgan.freeman@example.com', '2023-04-05', 'ACTIVE'),
('JodyStark', 'jody.stark@example.com', '2023-04-06', 'DELETED'),
('LindaEvans', 'linda.evans@example.com', '2023-04-07', 'ACTIVE'),
('RogerThat', 'roger.that@example.com', '2023-04-08', 'ACTIVE'),
('Nina_S', 'nina.s@example.com', '2023-04-09', 'ACTIVE'),
('MaxPower', 'max.power@example.com', '2023-04-10', 'ACTIVE'),
('DanaC', 'dana.c@example.com', '2023-04-11', 'ACTIVE'),
('EliotW', 'eliot.w@example.com', '2023-04-12', 'ACTIVE'),
('FionaG', 'fiona.g@example.com', '2023-04-13', 'SUSPENDED'),
('GregH', 'greg.h@example.com', '2023-04-14', 'ACTIVE'),
('HannahJ', 'hannah.j@example.com', '2023-04-15', 'DELETED'),
('IvanK', 'ivan.k@example.com', '2023-04-16', 'ACTIVE'),
('JuliaL', 'julia.l@example.com', '2023-04-17', 'ACTIVE'),
('KevinM', 'kevin.m@example.com', '2023-04-18', 'ACTIVE'),
('LauraN', 'laura.n@example.com', '2023-04-19', 'ACTIVE'),
('MikeO', 'mike.o@example.com', '2023-04-20', 'ACTIVE');

INSERT INTO Content (UserID, ContentType, ContentBody, PostDate, Status) VALUES
(1, 'POST', 'Loving the spring weather!', '2023-04-01', 'ACTIVE'),
(2, 'COMMENT', 'Totally agree with your point.', '2023-04-02', 'ACTIVE'),
(3, 'IMAGE', NULL, '2023-04-03', 'ACTIVE'),
(4, 'VIDEO', NULL, '2023-04-04', 'REVIEW'),
(5, 'POST', 'Had an amazing time hiking today!', '2023-04-05', 'ACTIVE'),
(6, 'COMMENT', 'This is really inappropriate.', '2023-04-06', 'REVIEW'),
(7, 'POST', 'Can someone recommend a good book?', '2023-04-07', 'ACTIVE'),
(8, 'IMAGE', NULL, '2023-04-08', 'ACTIVE'),
(9, 'VIDEO', NULL, '2023-04-09', 'REMOVED'),
(10, 'POST', 'I just completed a marathon!', '2023-04-10', 'ACTIVE'),
(11, 'POST', 'Check out my new art project!', '2023-04-11', 'ACTIVE'),
(12, 'COMMENT', 'Could not agree more!', '2023-04-12', 'ACTIVE'),
(13, 'IMAGE', NULL, '2023-04-13', 'ACTIVE'),
(14, 'VIDEO', NULL, '2023-04-14', 'REVIEW'),
(15, 'POST', 'A day at the zoo with family.', '2023-04-15', 'ACTIVE'),
(16, 'COMMENT', 'This is unacceptable behavior.', '2023-04-16', 'REVIEW'),
(17, 'POST', 'Looking for podcast recommendations.', '2023-04-17', 'ACTIVE'),
(18, 'IMAGE', NULL, '2023-04-18', 'ACTIVE'),
(19, 'VIDEO', NULL, '2023-04-19', 'REMOVED'),
(20, 'POST', 'Just finished a 5k run!', '2023-04-20', 'ACTIVE');

INSERT INTO Reports (ReportedContentID, ReportingUserID, ReportDate, Reason, Status) VALUES
(6, 1, '2023-04-11', 'INAPPROPRIATE', 'OPEN'),
(9, 2, '2023-04-12', 'COPYRIGHT', 'CLOSED'),
(4, 3, '2023-04-13', 'SPAM', 'OPEN'),
(6, 4, '2023-04-14', 'HARASSMENT', 'OPEN'),
(9, 5, '2023-04-15', 'SPAM', 'OPEN'),
(16, 11, '2023-04-21', 'HARASSMENT', 'OPEN'),
(19, 12, '2023-04-22', 'COPYRIGHT', 'CLOSED'),
(14, 13, '2023-04-23', 'SPAM', 'OPEN'),
(16, 14, '2023-04-24', 'INAPPROPRIATE', 'OPEN'),
(19, 15, '2023-04-25', 'SPAM', 'OPEN');


INSERT INTO Moderators (UserID, StartDate) VALUES
(1, '2023-04-01'),
(2, '2023-04-02'),
(3, '2023-04-03'),
(4, '2023-04-04');

INSERT INTO ModerationActions (ReportID, ModeratorID, ActionType, ActionDate, Notes) VALUES
(1, 1, 'REVIEWED', '2023-04-11', 'No violation found.'),
(2, 2, 'REMOVED', '2023-04-12', 'Removed for copyright infringement.'),
(3, 3, 'REVIEWED', '2023-04-13', 'Content marked as spam.'),
(4, 4, 'IGNORED', '2023-04-14', 'User warned.'),
(5, 1, 'REVIEWED', '2023-04-15', 'No action needed.'),
(6, 1, 'REVIEWED', '2023-04-21', 'Content reviewed, no action taken.'),
(7, 2, 'REMOVED', '2023-04-22', 'Removed for violating guidelines.'),
(8, 3, 'REVIEWED', '2023-04-23', 'Marked as not spam.'),
(9, 4, 'IGNORED', '2023-04-24', 'Content ignored after review.'),
(10, 1, 'REVIEWED', '2023-04-25', 'Reviewed and no issues found.');

INSERT INTO Appeals (ContentID, UserID, AppealDate, Reason, Status) VALUES
(9, 2, '2023-04-16', 'Claiming fair use on copyrighted material.', 'OPEN'),
(6, 4, '2023-04-17', 'Content was taken out of context.', 'DENIED'),
(19, 12, '2023-04-26', 'The content was original, not copyrighted.', 'OPEN'),
(16, 14, '2023-04-27', 'Requesting reconsideration of the moderation decision.', 'DENIED');

WITH JoinedTable AS (
    SELECT
        Users.Username,
        CASE
            WHEN Content.ContentType NOT IN ('POST', 'COMMENT') THEN 'N/A'
            ELSE Content.ContentBody
        END AS ContentBody,
        Content.Status,
        Content.PostDate,
        ROW_NUMBER() OVER(
            PARTITION BY Content.Status
            ORDER BY Content.PostDate DESC
        ) AS RowNum
    FROM Content JOIN Users ON Content.UserID = Users.UserID
)
SELECT
    Username,
    ContentBody,
    Status,
    PostDate
FROM JoinedTable WHERE RowNum <= 3
ORDER BY Status, PostDate DESC;

WITH JoinedTable AS (
  SELECT
      Content.ContentID,
      Content.ContentBody,
      'Creation' AS ActionType,
      Content.PostDate AS Date
  FROM Content
  UNION ALL
  SELECT
      Content.ContentID,
      Content.ContentBody,
      'Moderation' AS ActionType,
      ModerationActions.ActionDate AS Date
  FROM ModerationActions
  JOIN Reports ON ModerationActions.ReportID = Reports.ReportID
  JOIN Content ON Reports.ReportedContentID = Content.ContentID
)
SELECT
  ContentID,
  ContentBody,
  ActionType,
  Date,
  CASE
      WHEN LAG(Date) OVER(ORDER BY Date) IS NULL THEN 0.0
      ELSE julianday(Date) - julianday(LAG(Date) OVER(ORDER BY Date))
  END AS DaysSinceLastEvent
FROM JoinedTable
ORDER BY Date DESC, DaysSinceLastEvent;


-- Count of denied appeals for every user
WITH DeniedAppeals AS (
  SELECT
      UserID,
      COUNT(*) AS Appeals_Denied
  FROM Appeals
  WHERE Status = 'DENIED'
  GROUP BY UserID
)
SELECT
  Users.Username,
  DeniedAppeals.Appeals_Denied
FROM DeniedAppeals JOIN Users ON DeniedAppeals.UserID = Users.UserID
ORDER BY DeniedAppeals.Appeals_Denied DESC;