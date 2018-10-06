let myLibrary = [];

let title = document.getElementById("iTitle");
let author = document.getElementById("iAuthor");
let pages = document.getElementById("iPages");
let bNewBook = document.getElementById("new-book");
let bSaveBook = document.getElementById("save-book");

function Book(title, author, pages, read) {
  this.title = title;
  this.author = author;
  this.pages = pages;
  this.read = (read !== "") ? read : false;
  this.info = function() {
    var isread = (read === false) ? "not read yet" : "already read";
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
    row.id = i;
    let title = document.createElement("td");
    title.innerText = book.title;
    let author = document.createElement("td");
    author.innerText = book.author;
    let pages = document.createElement("td");
    pages.innerText = book.pages;
    let read = document.createElement("td");
    read.innerText = (book.read === undefined) ? "Not Read" : "Read";

    row.appendChild(title);
    row.appendChild(author);
    row.appendChild(pages);
    row.appendChild(read);
    document.querySelector("tbody").appendChild(row);
  }
}


bNewBook.addEventListener("click",function() {
  document.querySelector("form").style.display="block";
});

bSaveBook.addEventListener("click",function(e) {
  e.preventDefault();
  if (title.value === "" || author.value === "" || pages.value === "") {
    alert("Fill in all fields");
    return
  }
  var book = new Book(title.value, author.value, pages.value);
  addBookToLibrary(book);
  render();
});


function clearTable() {  
  let tb = document.querySelector("table");
  for (var i = tb.rows.length - 1; i > 0; i--){
      tb.deleteRow(i);
  }
}
