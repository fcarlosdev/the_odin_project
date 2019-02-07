import DOMTask from '../ui/dom-task';
import DOMElement from '../lib/dom-elem';

const DOMTaskList = (() => {

  const createTaskList = () => DOMElement('div').addClasses('tasks').element;

  const addTask = (project, task) => {
    let tasks  = project.children[1];
    let taskId = tasks.children.length + 1;
    tasks.insertBefore(DOMTask(taskId, task).createTask(), tasks.children[0]);
    return tasks;
  };

  const numberOfTasks = taskList => taskList.children.length;

  return {
    createTaskList, addTask, numberOfTasks,
  };

});

export default DOMTaskList;
