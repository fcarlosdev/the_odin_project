const Repository = (() => {

    let storage = sessionStorage

    const saveProject = project => {
        sessionStorage.setItem(project.id, JSON.stringify(project))
        return project
    }

    const findProject = id => JSON.parse(sessionStorage.getItem(id));

    const getProjects = () => 
      Object.assign([], sessionStorage)
            .filter(record => record !== null)
            .map(record => JSON.parse(record));

    return {
        saveProject, findProject, getProjects
    }
})
export default Repository