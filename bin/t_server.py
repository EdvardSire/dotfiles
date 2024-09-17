from fastapi import Depends, FastAPI, HTTPException
from pydantic import BaseModel
from typing import  Optional
import uvicorn

app = FastAPI()
TODO_FILE = "todo.txt"
STATIC_API_KEY = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

class TodoItem(BaseModel):
    todo: str

def verify_api_key(api_key: Optional[str] = None):
    if api_key != STATIC_API_KEY:
        raise HTTPException(status_code=401, detail="Invalid API Key")

@app.get("/api/v1/status")
async def status():
    return {}

@app.get("/api/v1/todos")
async def get_todos(api_key: str = Depends(verify_api_key)):
    try:
        with open(TODO_FILE, "r") as f:
            todos = f.readlines()
        return {"todos": [todo.strip() for todo in todos]}
    except FileNotFoundError:
        return {"todos": []}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/api/v1/todo")
async def add_todo(item: TodoItem, api_key: str = Depends(verify_api_key)):
    try:
        with open(TODO_FILE, "a") as f:
            f.write(item.todo + "\n")
        return {"status": "added"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.delete("/api/v1/todo/{line_number}")
async def delete_todo(line_number: int, api_key: str = Depends(verify_api_key)):
    try:
        with open(TODO_FILE, "r") as f:
            todos = f.readlines()
        if 0 <= line_number < (len(todos)+1):
            del todos[line_number-1]
            with open(TODO_FILE, "w") as f:
                f.writelines(todos)
            return {"status": "deleted"}
        else:
            raise HTTPException(status_code=400, detail="Invalid line number")
    except FileNotFoundError:
        raise HTTPException(status_code=400, detail="Todo list is empty")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.delete("/api/v1/nuke")
async def clear_all_todos(api_key: str = Depends(verify_api_key)):
    try:
        open(TODO_FILE, "w").close()  # This effectively clears the file
        return {"status": "all todos deleted"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


if __name__ == "__main__":
    PORT = 8500
    uvicorn.run("t_server:app", host="0.0.0.0", port=PORT, reload=True)
