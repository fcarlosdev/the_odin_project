import FrmTaskBody from "../partials/new-task-form.html";

const TaskFormController = (() => {

    let taskForm;

    const showForm = (saveEventImpl) => {
        taskForm = document.querySelector("#myModal");
        taskForm.innerHTML = FrmTaskBody;
        taskForm.style.display = "block";
        hideScrollBarOnBody(true);
        setSaveEvent(saveEventImpl);        
        closeFormEvent(taskForm);
    }

    const setSaveEvent = (implementation) => {
        document.querySelector("#save-button").addEventListener("click", implementation);
    }

    const closeFormEvent = () => {
        ["#cancel-button", ".close"].forEach((elem) => {
          document.querySelector(elem).addEventListener("click", f => {
            hideScrollBarOnBody(false);
            closeForm();
          });
        })
    }
    
    const closeForm = () => {
        taskForm.style.display = "none";
    }    

    const getTaskTitle = () => {
        return getFieldValue("#task-title");
    }

    const getTaskDescription = () => {
        return getFieldValue("#task-desc");
    }
    const getTaskDueDate = () => {
        return getFieldValue("#task-due-date");
    }
    const getTaskPripority = () => {
        return getFieldValue("#task-priority");
    }

    const getFieldValue = (fieldId) => {
        return document.querySelector(fieldId).value;
    }

    const hideScrollBarOnBody = (status) => {
        document.querySelector("body").style.overflow = (status) ? "hidden" : "auto";
    }

    return {
        showForm, closeForm, getTaskTitle, getTaskDescription, getTaskDueDate,
        getTaskPripority
    }

})();

export default TaskFormController;