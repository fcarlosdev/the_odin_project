import {Task} from "../models/task.js";

const TaskController = (() => {

  const createTask = (name, description, dueDate, priority) => {
    return Task(name,description, dueDate, priority);
  }

  return { createTask }

})();

export { TaskController }
