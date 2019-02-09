import ProjectFactory from '../factories/project-factory';
import Repository from '../storage/repository';


const ProjectController = (() => {

    const save = (id, name) => {
        Repository().saveProject(mapToStorage(ProjectFactory(id, name)));
    }

    const find = id => {
        let projectStorage = Repository().findProject(id);
        return (projectStorage !== null) ? mapToProject(projectStorage) : null;
    };

    const findByName = name => {        
        let resultado = Repository().getProjects()
                           .map(project => mapToProject(project))
                           .filter(project => project.getName() === name);        
        return resultado;
    }

    const mapToStorage = project => {
        return { id: project.getId(), name: project.getName(), tasks: [] };
    }

    const mapToProject = storaged => ProjectFactory(storaged.id, storaged.name);



    return {
        save, find, findByName
    }


})

export default ProjectController;