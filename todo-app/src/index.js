import "./util/imports.js";

let detailsStatus = "closed";
const todoView = document.querySelector(".container");

const btDetails = todoView.querySelector(".bt-details");
btDetails.addEventListener('click',function() {
  let taskDetails = todoView.querySelector(".task-details");
  if (detailsStatus === "closed") {
    taskDetails.style.display = "flex";
    taskDetails.style.flexDirection = "column";
    detailsStatus = "opened";
  } else {
    detailsStatus = "closed";
    taskDetails.style.display = "none";
  }
})
