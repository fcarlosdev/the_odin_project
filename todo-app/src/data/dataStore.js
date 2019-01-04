const DataStore = () => {

    const storage = localStorage;

    const saveTodo = (todo) => {
        try {            
            storage.setItem(todo.name.replace(" ",""), JSON.stringify(todo));
            return true;            
        } catch (error) {
            alert("Ocorred the follow error while trying save the todo: " + error);
            return false;
        }
    }

    const removeTodo = (key) => {
        try {            
            storage.removeItem(key);
            return true;
        } catch (error) {
            alert("It wasn't possible delete the todo " + key + " because of the error: " + error);
            return false;
        }
    }

    const findTodo = (todoKey) => {        
        return storage.getItem(todoKey);
    }

    return { saveTodo, removeTodo, findTodo }
}

export { DataStore }