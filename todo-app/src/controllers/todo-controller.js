import { Todo } from "../models/todo";
import { Task } from "../models/task";
import { DataStore } from "../data/dataStore";

const TodoController = () => {
    
    const storage = DataStore();

    const saveTodo = (todo) => {                
        return (storage.saveTodo(mapToTodoStorage(todo))) ? todo : null;        
    }

    const deleteTodo = (todo) => {
        storage.removeTodo(getTodoStorageKey(todo.getName()));
    }

    const findTodo = (todoName) => {        
        let todoStorage = JSON.parse(storage.findTodo(getTodoStorageKey(todoName)));
        return (todoStorage !== null) ? mapToTodoModel(todoStorage) : null;
    }

    const getTodoStorageKey = (todoName) => {
        return todoName.replace(" ","");
    }

    const mapToTodoStorage = (todoModel) => {
        return { id: todoModel.getId(), name: todoModel.getName(), tasks: [] };
    }

    const mapToTodoModel = (todoStorage) => {
        let todoModel = Todo(todoStorage.id, todoStorage.name);
        todoStorage.tasks.forEach(task => {
            todoModel.addTask(
                Task(task.id, task.name, task.description, task.dueDate, task.priority)
            );
        });
        return todoModel;
    }

    return {saveTodo, deleteTodo, findTodo}
}

export default TodoController