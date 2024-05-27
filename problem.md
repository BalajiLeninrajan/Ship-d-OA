## Shipd OA - April 3rd

Thank you for participating in this assessment to take part in our problem-solving platform! Please fork this template to get started.

We're in the progress of providing a huge variety of fun and challenging coding problems to our platform. The first group of problems we're releasing are SQL queries. To make sure we are onboarding engineers at a reasonable pace, please take a look at solving this assessment (~15 mins). We'll be inviting users onto the platform based on the results of the assessment.

The SQLite schema provided below represents a content management system for a social platform. Your job is to provide the optimal SQL query statements (NOT the result from executing those queries) that would be used to find the answers to the following problems in a production database.

Once you have your submissions, please submit them here.

*Using AI to help answer your questions is prohibited. You will be banned from joining the platform if we find your answer was plagiarized from any AI sources.*

Problems 
1. Find the latest 3 content belonging to each content status group. Provide the username of the content author, content (if the content is not a post or comment, specify 'N/A' instead), status, and posted date. 

2. 	Return every single instance of a content being created or moderated, sorted in descending order by the date (PostDate on content creation, or ActionDate on content moderation), as a single table. For each instance, provide the content's ID, the content body (or Null if there is none), the action type (either 'Creation' or 'Moderation'), Date and DaysSinceLastEvent. The day since last event is the number of days since the previous content creation/moderation instance took place.

3. Design a complex SQL question for this schema, and provide the corresponding answer as a SQL query. Your question should demand the usage of at least 4-5 keywords and be somewhat difficult to solve. 

An example for question 2:
```sql
ContentID|ContentBody|ActionType|Date|DaysSinceLastEvent
16|This is unacceptable behavior.|Creation|2023-04-16|1.0
9|NULL|Moderation|2023-04-15|0.0
15|A day at the zoo with family.|Creation|2023-04-15|1.0
6|This is really inappropriate|Moderation|2023-04-14|0.0
```

```
**Users**
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| UserID      | INTEGER |
| Username    | TEXT    |
| Email       | TEXT    |
| SignUpDate  | TEXT    |
| Status      | TEXT    |
+-------------+---------+

**Content**
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| ContentID    | INTEGER |
| UserID       | INTEGER |
| ContentType  | TEXT    |
| ContentBody  | TEXT    |
| PostDate     | TEXT    |
| Status       | TEXT    |
+--------------+---------+

**Reports**
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| ReportID         | INTEGER |
| ReportedContentID| INTEGER |
| ReportingUserID  | INTEGER |
| ReportDate       | TEXT    |
| Reason           | TEXT    |
| Status           | TEXT    |
+------------------+---------+

**Moderators**
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| ModeratorID  | INTEGER |
| UserID       | INTEGER |
| StartDate    | TEXT    |
| EndDate      | TEXT    |
+--------------+---------+

**Moderation Actions**
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| ActionID    | INTEGER |
| ReportID    | INTEGER |
| ModeratorID | INTEGER |
| ActionType  | TEXT    |
| ActionDate  | TEXT    |
| Notes       | TEXT    |
+-------------+---------+

**Appeals**
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AppealID    | INTEGER |
| ContentID   | INTEGER |
| UserID      | INTEGER |
| AppealDate  | TEXT    |
| Reason      | TEXT    |
| Status      | TEXT    |
+-------------+---------+
```







