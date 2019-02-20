import DOMSearch from '../dom/dom-search'
import DOMTask from '../dom/dom-task'
import FrmTask from "../partials/task-form.html"
import Task from '../models/task'
import TaskController from '../controllers/task-controller'
import ProjectController from '../controllers/project-controller'

const DOMFormTask = ((taskEL, project) => {

  let taskForm

  const show = () => {
    initForm()
    attachEventToCloseButton()
    attachEventToSaveButton()
    toggleTaskForm()
    DOMSearch().getElement('#task-name').focus()
  }

  const save = () => {
    const task = Task(generateId(),
                      getFieldValue('#task-name'),
                      getFieldValue('#task-desc'),
                      getFieldValue('#task-date'),
                      getFieldValue('#task-priority'),
                      project.id)

    ProjectController().addTask(TaskController().create(task), project)

    taskEL.appendChild(DOMTask(task).create())
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

  const generateId = () => {
    let numberOfTasks = ProjectController().getTasks(project.id).length
    return (numberOfTasks > 0) ? (numberOfTasks + 1) : 1
  }

  return { show }

})

export default DOMFormTask
