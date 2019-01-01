const Task = (id, name, description, dueDate, priority) => {

  const getId = () => id;
  const getName = () => name;
  const getDescription = () => description;
  const getDueDate = () => dueDate;
  const getPriority = () => priority;  

  return { getId, getName, getDescription, getDueDate, getPriority };

}

export { Task };