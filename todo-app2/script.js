
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
        project.setAttribute("id","project"+id);        
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
                newTask.setAttribute("id","task"+taskId);

            let taskHeader = document.createElement("div");
                taskHeader.classList.add("task-header");

            let taskTitle = document.createElement("h4");
                taskTitle.innerHTML = "Task name";

            let taskHeaderButtons = document.createElement("div");
                taskHeaderButtons.classList.add("t-header-buttons");

            let lkDetails = document.createElement("span");
                lkDetails.classList.add("lk-details");
                lkDetails.innerHTML = "Details";
                // lkDetails.addEventListener("click", () => {

                // })

            let lkRemove = document.createElement("span");
                lkRemove.classList.add("lk-remove");
                lkRemove.innerHTML = "Remove";

            taskHeaderButtons.appendChild(lkDetails);
            taskHeaderButtons.appendChild(lkRemove);
            taskHeader.appendChild(taskTitle);

            taskHeader.appendChild(taskHeaderButtons);
            
            let taskContent = document.createElement("div");
            taskContent.classList.add("task-content");
            taskContent.innerHTML = "This is a model of a task it'll be when the add task link is clicked";

            let taskFooter = document.createElement("div");
                taskFooter.classList.add("task-footer");

            let dueDate = document.createElement("span");
                dueDate.classList.add("due-date");
            let dueDateLabel = document.createElement("span");
                dueDateLabel.classList.add("l-bold");
                dueDateLabel.innerHTML = "Due date:";
            dueDate.appendChild(dueDateLabel);
            dueDate.innerHTML = " 31/01/2019";

            let priority = document.createElement("span");
                priority.classList.add("priority");
            let priorityLabel = document.createElement("span");
                priorityLabel.classList.add("l-bold");
                priorityLabel.innerHTML = "Priority:";
            priority.appendChild(priorityLabel);
            priority.innerHTML = " Low";

            let chkDone = document.createElement("input");
                chkDone.setAttribute("type","checkbox");
                chkDone.classList.add("task-done");
                chkDone.innerHTML = " Done";

            taskFooter.appendChild(dueDate);
            taskFooter.appendChild(priority);
            taskFooter.appendChild(chkDone);
            
            newTask.appendChild(taskHeader);
            newTask.appendChild(taskContent);
            newTask.appendChild(taskFooter);

            newTask.style.marginBottom = "10px";

            // tasks.appendChild(newTask);
            tasks.insertBefore(newTask,tasks.children[0]);

            let finalHeight = 80;
            for (let h = 0; h < tasks.children.length; h++) {
              finalHeight += 48;
            }

            if (finalHeight < 282) {
                project.style.height = finalHeight + "px";
            } 
            else {
                project.style.height = "320px";
            }

        }); 

        if (project.children[1].children.length == 0) {
            project.style.height = "80px";
        } 
        footer.appendChild(addTaskLink);
    return footer;        
}

clearFieldText = () => {
    fieldProjectName.value="";
}

let details = document.querySelector(".lk-details");
let task = document.querySelector(".task-item");
let taskDetails = document.querySelector(".task-content");
let taskFooter = document.querySelector(".task-footer");
let project = document.querySelector("#project1");

details.addEventListener("click", () => {
  task.style.height = (task.style.height == "150px") ? "38px" : "150px";
  details.textContent = (details.textContent == "Details") ? "Hide" : "Details";
  taskDetails.style.display =  (details.textContent == "Details") ? "none" : "flex";
  taskFooter.style.display= (details.textContent == "Details") ? "none" : "flex";
  project.style.height = "auto";
  project.style.display = "flex";  
})
