const DataStore = () => {

    const storage = localStorage;

    const saveTodo = (todo) => {
        try {
            storage.setItem(getTodoKey(todo.id), JSON.stringify(todo));
            return true;
        } catch (error) {
            alert("Ocorred the follow error while trying save the todo: " + error);
            return false;
        }
    }

    const removeTodo = todo => {
        try {
            storage.removeItem(getTodoKey(todo.getId()));
            return true;
        } catch (error) {
            alert("It wasn't possible delete the todo " + todo +
                  " because of the error: " + error);
            return false;
        }
    }

    const findTodoById = id => {
        return storage.getItem(getTodoKey(id));
    }

    const findTodo = todo => {
        return storage.getItem(getTodoKey(todo.getId()));
    }

    const getTodos = () => Object.assign({}, storage);


    const getTodoKey = todoId => "Todo".concat(todoId);

    return { saveTodo, removeTodo, findTodo, getTodos, findTodoById }
}

export { DataStore }
