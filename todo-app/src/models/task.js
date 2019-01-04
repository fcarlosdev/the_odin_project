const Task = (id, name, description, dueDate, priority, todoId) => {

  const getId = () => id;
  const getName = () => name;
  const getDescription = () => description;
  const getDueDate = () => dueDate;
  const getPriority = () => priority;
  const getTodoId = () => todoId;

  return { getId, getName, getDescription, getDueDate, getPriority, getTodoId };

}

export { Task };
