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

    const getProjects = () => Repository().getProjects()

    const getProject = id => {
        let project = Repository().findProject(project.id)        
        return (project !== undefined) ? project : null 
    }

    const generateId = () => Repository().getProjects().length + 1

    return {
        create, getProjects, getProject, addTask
    }
}

export default ProjectController