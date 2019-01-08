import { Todo } from "../models/todo";
import { Task } from "../models/task";
import { DataStore } from "../data/dataStore";

const TodoController = () => {

    const storage = DataStore();

    const saveTodo = (todo) => {
        return (storage.saveTodo(mapToTodoStorage(todo))) ? todo : null;
    }

    const deleteTodo = (todo) => {
        storage.removeTodo(todo);
    }

    const find = (todo) => {
        let todoStorage = JSON.parse(storage.findTodo(todo.id));
        return (todoStorage !== null) ? mapToTodoModel(todoStorage) : null;
    }

    const findTodoByName = (todoName) => {
       let todos = storage.getTodos();
       for( let key in todos) {
          let todo = mapToTodoModel(JSON.parse(todos[key]));
          if (todo.getName() == todoName)
             return todo;
       }
       return null;
    }

    const listTodos = () => {
        let todos = [];
        let storagedTodos = storage.getTodos();
        for (let todo in storagedTodos) {
            todos.push(mapToTodoModel(JSON.parse(storagedTodos[todo])));
        }
        return todos;
    }

    
    const mapToTodoStorage = (todoModel) => {
        return { id: todoModel.getId(), name: todoModel.getName(), tasks: [] };
    }

    const mapToTodoModel = (todoStorage) => {
        let todoModel = Todo(todoStorage.id, todoStorage.name);
        if (todoStorage.tasks !== undefined) {
            todoStorage.tasks.forEach(task => {
                todoModel.addTask(
                    Task(task.id, task.name, task.description, task.dueDate, task.priority)
                );
            });
        }
        return todoModel;
    }

    return {saveTodo, deleteTodo, find, findTodoByName, listTodos}
}

export default TodoController
