import DOMTask from '../ui/dom-task';
import DOMElement from '../lib/dom-elem';
import DOMSearch from '../lib/dom-search-elem';

const DOMTaskList = (() => {

  const createTaskList = () => DOMElement('div').addClasses('tasks').element;

  const addTask = (project, taskName) => {
    let tasks  = project.children[1];
    let taskId = tasks.children.length + 1;
    tasks.insertBefore(DOMTask().createTask(taskId, taskName), tasks.children[0]);
    return tasks;
  };

  const numberOfTasks = taskList => taskList.children.length;

  return {
    createTaskList, addTask, numberOfTasks,
  };

});

export default DOMTaskList;
