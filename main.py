from fastapi import FastAPI, HTTPException, status
from pydantic import BaseModel
from typing import Optional, List
from database import get_db_connection
import mysql.connector

app = FastAPI(title="Task Manager API")

# Pydantic Models
class UserBase(BaseModel):
    username: str
    email: str

class TaskBase(BaseModel):
    title: str
    description: Optional[str] = None
    status: Optional[str] = 'pending'
    user_id: int
    due_date: Optional[str] = None

# --------------------------
# Users CRUD Endpoints
# --------------------------
@app.post("/users", status_code=status.HTTP_201_CREATED)
async def create_user(user: UserBase):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "INSERT INTO Users (username, email) VALUES (%s, %s)",
            (user.username, user.email)
        )
        conn.commit()
        return {"user_id": cursor.lastrowid}
    except mysql.connector.Error as err:
        conn.rollback()
        raise HTTPException(status_code=400, detail=f"Database error: {err}")
    finally:
        cursor.close()
        conn.close()

@app.get("/users", response_model=List[dict])
async def get_users():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Users")
    users = cursor.fetchall()
    cursor.close()
    conn.close()
    return users

# Similar PUT and DELETE endpoints for Users
# Implement Tasks CRUD endpoints following the same pattern
