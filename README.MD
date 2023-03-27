# Pac Project Database Design

# Mission Statement
PacProject is a company that provides services in technology project development, including creating applications such as websites and mobile apps, maintaining systems, IT consulting, and other related services. You have been tasked with building a database for PacProject to organize the projects they have worked on. For each project, a project team will be selected by the company, consisting of employees from different departments, and there will be a project leader assigned to each project. Each project will have a different duration, depending on the agreement with the client. Therefore, you will organize the completed projects and the employees who worked on them through a relational database.

For further clarification, here are the facts and constraints of this task:

1. Employees can only work or be in one department.
2. Each department has one leader or manager.
3. Department managers are part of the company's employees.
4. The projects received are divided into several categories: Network Analysis, IT Consultant, App Development, and Managed Services.
5. Each project must have at least one employee working on it.
6. Each project has a leader responsible for organizing the project team.
7. PacProject stores data on clients who hire/use their services.
8. An employee can work on multiple projects at the same time.
9. An employee may also not work on a particular project, as the employee is responsible for handling internal PacProject affairs.

# Table Structures

In order to design our database, first let's determine what tables are required in this database.

| Table Name | Description | 
| --- | --- | 
| employee | Store general information for PacProject's employee |
| department | Store information list of PacProject's department.  Each department are led by one Department Manager (employee)
| project | Store information about project accepted by PacProjects |
| project_category | Store information about available category of each project |
| project_employee | Store information about which employee are working for which project |
| client | Store information about client of the project's and their affiliation |

# ER Diagram

After deciding required tables, we can create ER diagram that contain all of those table, relationship between them, field for each table, and primary-foreign key that are needed.

![](erd/pacproject-erd.png)

