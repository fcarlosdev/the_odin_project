const ProjectFactory = (name) => {

  let todoList = [];

  const getName = () => name;

  const addTodoItem = (item) => {
    todoList.push(item);
  }

  const getTodoList = () => {
    return todoList;
  }

  const removeTodoItem = (item) => {

    let pos = todoList.indexOf(item);

    if (pos != null) {
      todoList.splice(pos,1);
      return true;
    }
    return false;
  }
  return {
    getName, getTodoList, addTodoItem, removeTodoItem
  }
}

const ProjectItemFactory = (title, description, dueDate, priority) => {

  const getTitle = () => title;
  const getDescription = () => description;
  const getDueDate = () => dueDate;
  const getPriority = () => priority;

  return {
    getTitle, getDescription, getDueDate, getPriority
  }

}

export { ProjectFactory, ProjectItemFactory };
