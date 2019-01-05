import { DataStore } from "../data/dataStore";

const TaskController = () => {

    const storage = DataStore();

    const save = (task, todo) => {
        storage.saveTodo(
            addTaskToStoragedTodo(getStorageTodo(todo),
                                  maptTaskToStorage(task,todo.getId()))
        );
        return task;
    }

    const deleteTask = task => {
        let todo = getStorageTodoById(task.getTodoId());
        todo.tasks.splice(todo.tasks.findIndex(stgTask => stgTask.id == task.getId()),1);
        storage.saveTodo(todo);
    }

    const maptTaskToStorage = (task, todoId) => {
        return {
            id: task.getId(),
            name: task.getName(),
            description: task.getDescription(),
            dueDate: task.getDueDate(),
            priority: task.getPriority(),
            todoId: todoId
        }
    }

    const getStorageTodo = modelTodo => {
        return JSON.parse(storage.findTodo(modelTodo));
    }

    const getStorageTodoById = todoId => {
        return JSON.parse(storage.findTodoById(todoId));
    }

    const addTaskToStoragedTodo = (storagedTodo, task) => {
        storagedTodo.tasks.push(task);
        return storagedTodo;
    }

    return { save, deleteTask };

}

export default TaskController
