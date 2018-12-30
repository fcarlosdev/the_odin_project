const Todo = (id, name) => {

  let tasks = [];

  const getId = () => id;
  const getName = () => name;

  const addTask = (task) => {
    tasks.push(task);
  }

  const getTasks = () => {
    return tasks;
  }

  const hasTasks = () => {
    return tasks.length > 0;
  }

  return { getId, getName, addTask, getTasks, hasTasks }

};

export {Todo};
