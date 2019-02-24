import ProjectUI from './ui/projectUI'
import DOMTaskList from './ui/dom-task-list'
import DOMSearch from './ui/dom-search'
import ProjectController from './controllers/project-controller'

let controller = ProjectController()
let projectUI = ProjectUI()
let projectsUI = DOMSearch().getElement('.projects')

const TodoApp = () => {

    const createDefaultProject = withTitle => {        
        if (controller.totalOfProjects() == 0)
            createProject(withTitle)
    }

    const createProject = withTitle => 
        addToProjectList(buildProject(controller.create(withTitle), projectUI.withTasks()))

    const loadProjects = () => {
        controller.getProjects().forEach(project => {
            if (!projectAlreadLoaded(project))
                addToProjectList(buildProject(project, loadTasks(project)))
        })
    }

    const loadTasks = fromProject => mapToTasksUI(fromProject.tasks, projectUI.withTasks())

    const mapToTasksUI = (tasks, toTasksUI) =>{
        tasks.forEach(task => DOMTaskList().loadTask(task, toTasksUI))
        return toTasksUI
    } 

    const addToProjectList = project =>  projectsUI.appendChild(project)

    const projectAlreadLoaded = project => {        
        
        return Object.assign([],projectsUI.children)
              .some(projectDB => Number(projectDB.getAttribute('storageid')) === project.id )
    }

    const buildProject = (projectModel, taskskUI) => {
        if (projectModel != undefined)
            return projectUI.create(
                        projectModel, projectUI.withHeader(
                            projectUI.withTitle(projectModel),
                            projectUI.witButtons(projectUI.withBtAddTask(taskskUI, projectModel),
                                                 projectUI.withBtDelProject(projectModel, controller))
                        ), taskskUI
                    )
    }

    return {
        createProject, loadProjects, createDefaultProject
    }
}

export default TodoApp