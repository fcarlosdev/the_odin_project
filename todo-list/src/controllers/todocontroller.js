const todoController = (app) => {

  let todoFactory = app.todoFactory;

  const newTodo = (title) => {
    return todoFactory.Todo(title);
  }

  const newTask = (taskData) => {
    return todoFactory.Task(taskData.title, taskData.description,
       taskData.dueDate, taskData.priority);
  }

  return { newTodo, newTask };

};

export { todoController };
