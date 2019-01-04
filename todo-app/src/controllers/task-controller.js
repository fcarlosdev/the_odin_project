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
        let storagedTodo = getStorageTodoById(task.getTodoId());
        for(let key in storagedTodo.tasks) {
            let storagedTask = storagedTodo[key];
            console.log(storagedTask);
        }
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

    const findTaskById = taskId => {

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

    return { save };

}

export default TaskController
