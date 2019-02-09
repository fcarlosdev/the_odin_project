const ProjectFactory = (id, name) => {

    let tasks = [];

    const getId = () => id;

    const getName = () => name;

    const addTask = task => tasks.push(task);

    const getTasks = () => tasks;

    const getTask = id => task.filter(task, task.id === id);

    return {
        getId, getName, addTask, getTasks, getTask
    }
}

export default ProjectFactory;