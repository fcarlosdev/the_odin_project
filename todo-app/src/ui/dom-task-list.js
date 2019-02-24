import DOMTask from '../ui/dom-task'
import DOMSearch from '../ui/dom-search'

import Utils from '../util/utils'
import ProjectController from '../controllers/project-controller'

const prjControl = ProjectController()

const DOMTaskList = (() => {

  const addTask = (task, tasksEL, toProject) => {

      tasksEL.appendChild(DOMTask(task).create())
      prjControl.addTask(task, toProject)

      if (tasksEL.style.display === 'none')
        tasksEL.style.display = 'flex'
  }

  const removeTask = (task, project) => {
    let tasks = DOMSearch().getChildren(project,1)
    tasks.removeChild(task)
    prjControl.removeTask(task.getAttribute('storageid'),
                                   project.getAttribute('storageid'))
    Utils().controlListTasksVibility(project)
  }

  const loadTask = (task, tasksEL) => {
    tasksEL.appendChild(DOMTask(task).create())
  }
  
  return {
    addTask, removeTask, loadTask
  }

})

export default DOMTaskList
