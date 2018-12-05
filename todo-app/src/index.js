import "./util/imports.js";

let detailsStatus = "closed";
const todoView = document.querySelector(".container");

const btDetails = todoView.querySelector(".bt-details");

btDetails.addEventListener('click',function() {
  let taskTitle = todoView.querySelector(".task-title");
  let taskDetails = todoView.querySelector(".task-details");
  if (detailsStatus === "closed") {
    detailsStatus = "opened";
    taskDetails.style.display = "flex";
    taskDetails.style.flexDirection = "column";
    taskTitle.querySelector("a").textContent = "Hide details";
  } else {
    detailsStatus = "closed";
    taskDetails.style.display = "none";
    taskTitle.querySelector("a").textContent = "Show details";
  }
});

todoView.querySelector("#tsk-done").addEventListener('click',function(c) {
  if (this.checked) {
    todoView.querySelector(".task-done").style.color = "#1b7bdf";
    todoView.querySelector("#tsk-one").querySelector('h2').style.textDecoration="line-through";
  } else {
    todoView.querySelector(".task-done").style.color = "#000";
    todoView.querySelector("#tsk-one").querySelector('h2').style.textDecoration="none";
  }
})
