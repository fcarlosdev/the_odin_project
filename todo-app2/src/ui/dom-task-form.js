import DOMSearch from '../lib/dom-search-elem';
import FrmTaskBody from "../partials/new-task-form.html";

const DOMFormTask = (() => {

  let taskForm;

  const show = () => {    
    initForm();
    setCloseButtonEvent();
    toggleTaskForm();
  }

  const initForm = () => {
    taskForm = DOMSearch().getElement('#myModal');
    taskForm.innerHTML = FrmTaskBody;
  }

  const toggleTaskForm = () =>  taskForm.classList.toggle('show-modal');

  const setCloseButtonEvent =() => 
    DOMSearch().getElement(".close-button")
               .addEventListener('click', toggleTaskForm);


  return { 
    show
  }

});

export default DOMFormTask;
