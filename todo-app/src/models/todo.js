const Todo = (name) => {

  let tasks = [];

  const getName = () => name;

  const addTask = (task) => {
    tasks.push(task);
  }

  const getTasks = (fromTodo) => {
    return tasks;
  }

  return { getName, addTask, getTasks }

};

export {Todo};
