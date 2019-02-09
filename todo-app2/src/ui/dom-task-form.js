import DOMSearch from '../lib/dom-search-elem';
import DOMTaskList from  '../ui/dom-task-list';
import Util from '../util/utility.js';
import FrmTaskBody from "../partials/new-task-form.html";
import TaskFactory from '../factories/task-factory';

const DOMFormTask = ((project) => {

  let taskForm;

  const show = () => {    
    initForm();    
    attachEventToCloseButton();
    attachEventToSaveButton();
    toggleTaskForm();
  }

  const save = () => {
    const task = TaskFactory(
      getFieldValue('#task-name'),
      getFieldValue('#task-desc'),
      getFieldValue('#task-date'),
      getFieldValue('#task-priority')
    );

    DOMTaskList().addTask(project, task);
    Util().setProjectHeight(project);
    toggleTaskForm();
  }

  const initForm = () => {
    taskForm = DOMSearch().getElement('#myModal');
    taskForm.innerHTML = FrmTaskBody;    
  }

  const toggleTaskForm = () =>  taskForm.classList.toggle('show-modal');

  const attachEventToCloseButton =() => {
    DOMSearch().getElement(".close-button")
               .addEventListener('click', toggleTaskForm);
    DOMSearch().getElement("#cancel-button")
               .addEventListener('click', toggleTaskForm);
  }

  const attachEventToSaveButton = () =>
    DOMSearch().getElement("#save-button")
               .addEventListener('click', save);
  
  const getFieldValue = selector => DOMSearch().getElement(selector).value;

  return { 
    show
  }

});

export default DOMFormTask;
