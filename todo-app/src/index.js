import './assets/css/main.css'
import './assets/css/task-form.css'
import './assets/css/shared.css'

import DOMSearch from './dom/dom-search'
import DOMTaskList from './dom/dom-task-list'

import ProjectController from './controllers/project-controller'

import Utils from './util/utils'

import TodoApp from './todo-app'

let txtProjName = DOMSearch().getElement('#field-project-name')
let projectsEL = DOMSearch().getElement('.projects')
let controller = ProjectController()
let app = TodoApp()

DOMSearch().getElement('#bt-project').addEventListener('click', () => {

    if (txtProjName.value.length > 0) {

        let project = controller.create(txtProjName.value)

        let tasksEL = app.createTaskListWrapper()

        let btAddTaskEL = app.createBtAddTask(tasksEL, project)

        let btDelProject = app.createBtDelProject(project, controller)

        let buttonsWrapper = app.createButtonsWrapper(btAddTaskEL, btDelProject)

        let projectTitleEL = app.createProjectTitle(project)

        let projectHeader = app.createProjectHeader(projectTitleEL, buttonsWrapper)

        let projectEL = app.createProjectEL(project, projectHeader, tasksEL)

        Utils().controlListTasksVibility(projectEL)
        projectsEL.appendChild(projectEL)

        txtProjName.value = ''
        txtProjName.focus()

    }

})

controller.getProjects().forEach(project => {

    let tasksEL = app.createTaskListWrapper()
    Object.assign([],project.tasks).forEach(task => {
        DOMTaskList().loadTask(task, tasksEL)
    })

    let projectEL = app.createProjectEL(
                        project, app.createProjectHeader(
                                    app.createProjectTitle(project), 
                                    app.createButtonsWrapper(
                                        app.createBtAddTask(tasksEL, project), 
                                        app.createBtDelProject(project, controller)
                                    )
                                ), tasksEL)
    Utils().controlListTasksVibility(projectEL)

    projectsEL.appendChild(projectEL)


})