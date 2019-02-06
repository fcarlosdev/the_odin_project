import DOMSearch from '../lib/dom-search-elem';
import DOMTaskList from  '../ui/dom-task-list';
import Util from '../util/utility.js';
import FrmTaskBody from "../partials/new-task-form.html";

const DOMFormTask = ((project) => {

  let taskForm;

  const show = () => {    
    initForm();
    attachEventToCloseButton();
    attachEventToSaveButton();
    toggleTaskForm();
  }

  const save = () => {
    DOMTaskList().addTask(project, getFormField('#task-name').value);
    Util().setProjectHeight(project);
    toggleTaskForm();
  }

  const initForm = () => {
    taskForm = DOMSearch().getElement('#myModal');
    taskForm.innerHTML = FrmTaskBody;
  }

  const toggleTaskForm = () =>  taskForm.classList.toggle('show-modal');

  const attachEventToCloseButton =() => 
    DOMSearch().getElement(".close-button")
               .addEventListener('click', toggleTaskForm);

  const attachEventToSaveButton = () =>
    DOMSearch().getElement("#save-button")
               .addEventListener('click', save);
  
  const getFormField = selector => DOMSearch().getElement(selector);

  return { 
    show
  }

});

export default DOMFormTask;
