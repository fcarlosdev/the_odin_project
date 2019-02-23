import Project from '../models/project'
import Repository from '../data_store/repository'

const ProjectController = () => {

    const create = (name) => 
        Repository().saveProject(Project(generateId(), name))

    const addTask = (task, toProject) => {
        if ( task !== undefined ){
            let record = Repository().findProject(toProject.id)
            record.tasks.push(task)
            Repository().saveProject(record)
        }
    }

    const removeProject = id => {
        try {            
            Repository().removeProject(id)
            return true
        } catch (error) {
            alert("Ocorred an erro during removing: " + error)
            return false
        }
    }

    const removeTask = (taskId, fromProjecId) => {
        let project = Repository().findProject(fromProjecId)
        project.tasks.splice(getTaskIndex(project, taskId),1)
        Repository().saveProject(project)  
    }

    const getProjects = () => Repository().getProjects()

    const getProject = id => {
        let project = Repository().findProject(project.id)        
        return (project !== undefined) ? project : null 
    }

    const getTasks = projId => Repository().findProject(projId).tasks

    const getTaskIndex = (project, taskId) => project.tasks.findIndex(task => task.id == taskId)

    const generateId = () => Repository().getProjects().length + 1

    const totalOfProjects = () => Repository().getProjects().length

    return {
        create, getProjects, getProject, addTask, 
        removeTask, getTasks, removeProject, totalOfProjects
    }
}

export default ProjectController