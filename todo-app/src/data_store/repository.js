const Repository = (() => {

    let storage = localStorage

    const saveProject = project => {
        storage.setItem(project.id, JSON.stringify(project))
        return project
    }

    const findProject = id => JSON.parse(storage.getItem(id));

    const removeProject = id => {        
        storage.removeItem(id)
    }

    const getProjects = () => 
      Object.assign([], storage)
            .filter(record => record !== null)
            .map(record => JSON.parse(record));

    return {
        saveProject, findProject, getProjects, removeProject
    }
})
export default Repository