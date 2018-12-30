const TodoController = () => {

    let todos;

    const saveTodo = (todo) => {
        
        if (todos === undefined)
          todos = [];

        todos.push(todo);
        return todo;
    }

    const deleteTodo = (todo) => {
        todos.splice(todos.indexOf(todo),1);
    }

    const findTodo = (todoId) => {
        return todos.filter(todo => todo.getId() === todoId)[0]
    }

    const getTodos = () => {
        return todos;
    }

    return {saveTodo, deleteTodo, findTodo, getTodos}
}

export default TodoController