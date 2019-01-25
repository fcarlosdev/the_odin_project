
let projects = document.querySelector(".projects");
let fieldProjectName = document.querySelector("#proj-txt-name");


document.querySelector("#bt-add-prj").addEventListener("click", 
    () => {
        let projId = projects.children.length + 1;
        addProjectToProjectList(createProject(projId, getProjectName()))
    }
)

getProjectName = () => fieldProjectName.value;

addProjectToProjectList = project => {        
    projects.appendChild(project);
    clearFieldText();
}

createProject = (id, name) => {
    let project = document.createElement("div");
        project.classList.add("project");
        project.setAttribute("id",id);        
        project.appendChild(createProjectTitle(name));
        project.appendChild(createTaskList());
        project.appendChild(createProjectFooter(project));

        // let finalHeight = 80;
        // for (let h = 0; h < project.children[1].length; h++) {
        //     finalHeight += 38;
        // }

        // project.style.height = finalHeight + "px";
    return project;
}

createProjectTitle = title => {
    let projectTitle = document.createElement("h3");
        projectTitle.innerHTML = title;
    return projectTitle;
}

createTaskList = () => {
    let tasks = document.createElement("div");
        tasks.classList.add("tasks");       
    return tasks;
}

createProjectFooter = project => {
    let footer = document.createElement("div");
        footer.classList.add("project-footer");
    let addTaskLink = document.createElement("span");
        addTaskLink.classList.add("newtask");
        addTaskLink.innerHTML = "+ Add task";
        addTaskLink.addEventListener("click", (event) => {

            let tasks = project.children[1];

            let taskId = tasks.children.length + 1;
            let newTask = document.createElement("div");
                newTask.classList.add("task-item");
                newTask.setAttribute("id",taskId);
                newTask.innerHTML = "Task"+taskId;
            
            tasks.appendChild(newTask);

            let finalHeight = 80;
            for (let h = 0; h < tasks.children.length; h++) {
              finalHeight += 48;
            }

            if (finalHeight < 282) {
                project.style.height = finalHeight + "px";
            } else {
                project.style.height = 282 + "px";
            }
            
                
        });
        footer.appendChild(addTaskLink);
    return footer;        
}

clearFieldText = () => {
    fieldProjectName.value="";
}
