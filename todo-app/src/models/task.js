const Task = (name, description, dueDate, priority) => {

  const getName = () => name;
  const getDescription = () => description;
  const getDueDate = () => dueDate;
  const getPriority = () => priority;

  return { getName, getDescription, getDueDate, getPriority };

}

export { Task };
