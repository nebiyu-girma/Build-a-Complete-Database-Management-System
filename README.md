# Build-a-Complete-Database-Management-System
Project-Root/
├── Question1_Library_Management/
│   └── library.sql
│
├── Question2_Task_Manager_API/
│   ├── app/
│   │   ├── __init__.py
│   │   ├── main.py
│   │   └── database.py
│   ├── requirements.txt
│   ├── task_manager.sql
│   └── README.md
│
└── MAIN_README.md


# Task Manager API

## Description
A RESTful API for managing users and their tasks with MySQL integration.

## Setup
1. **Database Setup**:
   ```bash
   mysql -u root -p < task_manager.sql
   ```
2. **Environment Setup**:
   ```bash
   pip install -r requirements.txt
   cp .env.example .env  # Update credentials in .env
   ```
3. **Run the API**:
   ```bash
   uvicorn app.main:app --reload
   ```

## API Documentation
| Endpoint         | Method | Description                |
|------------------|--------|----------------------------|
| `/users`         | GET    | Get all users              |
| `/users`         | POST   | Create new user            |
| `/users/{id}`    | PUT    | Update user                |
| `/users/{id}`    | DELETE | Delete user                |
| `/tasks`         | GET    | Get all tasks              |
| `/tasks`         | POST   | Create new task            |
| `/tasks/{id}`    | PUT    | Update task                |
| `/tasks/{id}`    | DELETE | Delete task                |

## ERD Diagram


# Database & CRUD API Projects

## Question 1: Library Management System
- **File**: `Question1_Library_Management/library.sql`
- **Setup**:
  ```bash
  mysql -u root -p < library.sql

