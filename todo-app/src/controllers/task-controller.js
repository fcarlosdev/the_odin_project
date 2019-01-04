const TaskController = () => {

    const save = (task, todo) => {

        let newTask = {
                id: task.getId(), 
                name: task.getName(), 
                description: task.getDescription(),
                dueDate: task.getDueDate(),
                priority: task.getPriority()
            }

        let todoLocalStoareKey = getTodoStorageKey(todo); 

        let taskOfTodo = JSON.parse(localStorage.getItem(todoLocalStoareKey));

        taskOfTodo.tasks.push(newTask);
        
        localStorage.setItem(todoLocalStoareKey,JSON.stringify(taskOfTodo));

        return task;
    }

    const deleteTask = (task) => {
            
    }

    //Repeated has to be refactored
    const getTodoStorageKey = (todo) => {
        return todo.getName().replace(" ","");
    }

    return { save };

}

export default TaskController