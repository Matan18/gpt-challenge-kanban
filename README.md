# GPT Challenge 1: Task Management System with Collaboration Features

I asked to Chat GPT to help me imagine a project to challenge my skills.
I sad I could use Rust, Go, Elixir, with a "complex" database (with more than 1 table).

This was his answear:

## Project: Task Management System with Collaboration Features

### Overview

Build a task management system that allows users to create, manage, and collaborate on tasks. The application should support multiple users, each with their own tasks and projects. Users should be able to create tasks, assign them to others, set due dates, and mark tasks as completed.

### Features

1. **User Authentication:**

   - Allow users to register, log in, and log out.
   - Implement user authentication and authorization to ensure that users can only access their own tasks.

2. **Task Management:**

   - Users should be able to create, edit, and delete tasks.
   - Tasks should have attributes like title, description, due date, started date, completed date, and status (e.g., in progress, completed).
   - Implement task categories or tags to organize tasks.

3. **Collaboration:**

   - Users should be able to assign tasks to others.
   - Add the ability for users to comment on tasks for collaboration.
   - Implement real-time updates using WebSockets with **Elixir** to reflect changes made by other users.

4. **Project Management:**

   - Allow users to organize tasks into projects.
   - Users can invite others to collaborate on a project.
   - Each project can have its own set of tasks.

5. **Complex Database Schema:**

   - Design a database schema that includes tables for users, tasks, comments, projects, etc.
   - Use relationships (foreign keys) between tables to represent connections between entities.

6. **Tech Stack:**

   - Use **Rust** for the core backend logic and RESTful API.
   - Utilize **Elixir** for handling WebSockets and real-time features.
   - Employ **Go** for background job processing, taking advantage of its concurrency model and efficiency.

7. **Database:**

   - Consider using a relational database like **PostgreSQL** to store the complex schema.

8. **RESTful API:**
   - Design and implement a RESTful API to handle CRUD operations for tasks, projects, and users.

This project will challenge you to work with multiple languages, each playing to its strengths in different aspects of the application. Feel free to adjust the features based on your preferences and add any additional functionalities you find interesting. Good luck, and have fun building!

### Docs

- [Application Structure](./application-description.md)
- [User API Blueprint](./user-actions-description.md)
- [Team API Blueprint](./team-actions-description.md)
- [Project API Blueprint](./project-actions-description.md)
- [Task API Blueprint](./task-actions-description.md)
- [Task Comment API Blueprint](./task-comment-actions-description.md)
