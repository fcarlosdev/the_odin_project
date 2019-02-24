import DOMSearch from './dom-search'
import DOMTaskList from './dom-task-list'
import FrmTask from "../partials/task-form.html"
import TaskController from '../controllers/task-controller'

const taskControl = TaskController()

const DOMFormTask = ((tasksEL, project) => {

  let taskForm

  const show = () => {
    initForm()
    attachEventToCloseButton()
    attachEventToSaveButton()
    toggleTaskForm()
    DOMSearch().getElement('#task-name').focus()
  }

  const save = () => {
    DOMTaskList().addTask(createTask(project), tasksEL, project)
    toggleTaskForm()
  }

  const initForm = () => {
    taskForm = DOMSearch().getElement('#formTask')
    taskForm.innerHTML = FrmTask
  }

  const toggleTaskForm = () =>  taskForm.classList.toggle('show-modal')

  const attachEventToCloseButton =() => {
    DOMSearch().getElement(".close-button")
               .addEventListener('click', toggleTaskForm)
    DOMSearch().getElement("#cancel-button")
               .addEventListener('click', toggleTaskForm)
  }

  const attachEventToSaveButton = () =>
    DOMSearch().getElement("#save-button")
               .addEventListener('click', save)

  const getFieldValue = selector => DOMSearch().getElement(selector).value.trim()

  const createTask = () =>
    taskControl.create(taskControl.generateId(project),
                       getFieldValue('#task-name'),
                       getFieldValue('#task-desc'),
                       getFieldValue('#task-date'),
                       getFieldValue('#task-priority'),
                      project.id)

  return { show }

})

export default DOMFormTask
