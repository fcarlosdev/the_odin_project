let myLibrary = [];

const NEW_BOOK  = "new";
const SAVE_BOOK = "save";
const CANCEL = "cancel";

let title     = document.getElementById("iTitle");
let author    = document.getElementById("iAuthor");
let pages     = document.getElementById("iPages");
let read      = document.getElementById("sRead");
let bNewBook  = document.getElementById("new-book");
let bSaveBook = document.getElementById("save-book");
let bCancel   = document.getElementById("cancel-button")



function Book(title, author, pages, read) {
  this.title = title;
  this.author = author;
  this.pages = pages;
  // this.read = (read === "yes") ? true : false;
  this.read = read;
  this.info = function() {
    var isread = (read === "no") ? "not read yet" : "already read";
    return this.title + " by " + this.author + ", " + this.pages + " pages " +
      isread;
  }
}

function addBookToLibrary(book) {
  myLibrary.push(book);
  localStorage.setItem('books', JSON.stringify(myLibrary));
}

function render() {
  let myBooks = JSON.parse(localStorage.getItem('books'));
  clearTable();
  for(i = 0; i < myBooks.length; i++) {
    let book = myLibrary[i];
    let row = document.createElement("tr");
    applyStyle(row,"borderBottom","1px solid #cacaca")
    applyStyle(row,"height","50px");
    row.id = i;

    let title = document.createElement("td");
    title.innerText = book.title;
    applyStyle(title,"paddingLeft","15px");

    let author = document.createElement("td");
    author.innerText = book.author;
    applyStyle(author,"paddingLeft","15px");

    let pages = document.createElement("td");
    pages.innerText = book.pages;
    applyStyle(pages,"textAlign","right");

    let read = document.createElement("td");
    read.innerText = (book.read === "no") ? "Not Read" : "Read";
    applyStyle(read,"paddingLeft","20px");
    applyStyle(read,"textAlign","left");

    row.appendChild(title);
    row.appendChild(author);
    row.appendChild(pages);
    row.appendChild(read);
    document.querySelector("tbody").appendChild(row);
  }
}


bNewBook.addEventListener("click",function() {
  showFormItems(NEW_BOOK);
});

bSaveBook.addEventListener("click",function(e) {
  e.preventDefault();
  if (title.value === "" || author.value === "" || pages.value === "") {
    alert("Fill in all fields");
    return
  }
  var book = new Book(title.value, author.value, pages.value, read.value);
  showFormItems(SAVE_BOOK);
  addBookToLibrary(book);
  render();
});

bCancel.addEventListener('click',function(e) {
  e.preventDefault();
  showFormItems(CANCEL);
})


function clearTable() {
  let tb = document.querySelector("table");
  for (var i = tb.rows.length - 1; i > 0; i--){
      tb.deleteRow(i);
  }
}


function showFormItems(operation) {
  if (operation === NEW_BOOK) {
    document.querySelector("#new-book").style.display="none";
    document.querySelector("fieldset").style.display="block";
  } else if (operation === SAVE_BOOK || operation === CANCEL) {
    document.querySelector("#new-book").style.display="block";
    document.querySelector("fieldset").style.display="none";
  }

}


function applyStyle(toObject, newStyle, value) {
  toObject.style[newStyle] = value;
}
