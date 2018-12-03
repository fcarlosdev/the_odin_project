import {taskForm} from '../components/taskForm.js';

const linkNewTask = (appView,controller) => {

  const create = (todoTasks, taskId) => {

    let lkNewTask = appView.createElement('a');
    lkNewTask.setAttribute('url','#');
    lkNewTask.style.cursor = 'pointer';
    lkNewTask.textContent = "+";

    lkNewTask.addEventListener('click',function() {
      if (appView.querySelector(".task-form") == undefined) { //Only one form at time.
        todoTasks.appendChild(taskForm(appView).newForm(controller,todoTasks,taskId));
      }
    });

    return lkNewTask;
  }

  return { create };
}

export { linkNewTask }
