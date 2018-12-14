const Todo = (name) => {

  let tasks = [];

  const getName = () => name;

  const addTaskTo = (task) => {
    tasks.push(task);
  }

  const getTasks = () => {
    return tasks;
  }

  return { getName, addTaskTo, getTasks }

};

export {Todo};
