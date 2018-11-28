const Todo = (name) => {

  let tasks = [];

  const getName = () => name;

  const addTask = (task) => {
    tasks.push(task);
  }

  const getTasks = () => {
    return tasks;
  }

  const removeTask = (task) => {

    let pos = tasks.indexOf(task);

    if (pos != null) {
      tasks.splice(pos,1);
      return true;
    }
    return false;
  }
  return {
    getName, getTasks, addTask, removeTask
  }
}

const Task = (title, description, dueDate, priority) => {

  const getTitle = () => title;
  const getDescription = () => description;
  const getDueDate = () => dueDate;
  const getPriority = () => priority;

  return {
    getTitle, getDescription, getDueDate, getPriority
  }

}

export { Todo, Task };
