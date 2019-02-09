import ProjectFactory from "../factories/project-factory";

const Repository = (() => {

    const saveProject = (project) => 
      sessionStorage.setItem(project.id, JSON.stringify(project));
    
    const findProject = id => JSON.parse(sessionStorage.getItem(id));

    const getProjects = () => 
      Object.assign([], sessionStorage)
            .filter(storaged => storaged !== null)
            .map(storaged => JSON.parse(storaged));


    const storageAvailable = () => {
        if (typeof(Storage) !== "undefined") {
            return true;
          } else {
            return false;
          }
    }


    return {
      storageAvailable, saveProject, findProject, getProjects
    }

});

export default Repository;