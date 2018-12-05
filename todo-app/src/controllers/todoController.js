import {Todo} from "../models/todo.js";

const TodoController = (() => {

  const createTodo = (name) => {
    return Todo(name);
  }

  return { createTodo };
})();

export { TodoController };
