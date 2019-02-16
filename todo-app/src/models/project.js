const Project = (id, name) => {

    let tasks = []    
    
    const getTask = id => tasks.filter(task => task.id === id)

    return {
        id, name, tasks, getTask
    }

}

export default Project