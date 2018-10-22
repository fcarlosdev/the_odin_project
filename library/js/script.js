let myLibrary = [];
let bookId = 1;

const NEW_BOOK  = "new";
const SAVE_BOOK = "save";
const CANCEL = "cancel";

let title     = document.getElementById("iTitle");
let author    = document.getElementById("iAuthor");
let pages     = document.getElementById("iPages");
let read      = document.getElementById("sRead");
let bNewBook  = document.getElementById("new-book");
let bSaveBook = document.getElementById("save-book");
let bCancel   = document.getElementById("cancel-button");

class Book {
  constructor(title, author, pages, read) {
    this.id     = bookId++;
    this.title  = title;
    this.author = author;
    this.pages  = pages;
    this.read   = read;
  }

  info() {
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
    let book = myBooks[i];
    let row = document.createElement("tr");
    applyStyle(row,"borderBottom","1px solid #cacaca")
    applyStyle(row,"height","60px");
    row.id = (i+1);

    let title = document.createElement("td");
    title.innerText = book.title;
    applyStyle(title,"paddingLeft","15px");

    let author = document.createElement("td");
    author.innerText = book.author;
    applyStyle(author,"paddingLeft","15px");

    let pages = document.createElement("td");
    pages.innerText = book.pages;
    applyStyle(pages,"textAlign","right");

    let status = (book.read === "yes") ? "Read" : "Not Read";
    let btStatus  = createButton(status);

    // btStatus = createButton("Not Read");
    btStatus.setAttribute("id","btStatus" + book.id);
    btStatus.setAttribute("book",book.id);
    applyStyle(btStatus,"border","none");
    applyStyle(btStatus,"padding","10px");
    applyStyle(btStatus,"color","#fff");
    applyStyle(btStatus,"font-weight","bold");
    applyStyle(btStatus,"background","#1b7e0b");
    applyStyle(btStatus,"cursor","pointer");
    applyStyle(btStatus,"width","80px");

    btStatus.addEventListener('click',function(e) {
      let book = findBook(parseInt(this.getAttribute("book")));
      e.preventDefault;
      if (this.innerText === "Not Read") {
        book.read = true;
        this.innerText = "Read";
      } else {
        book.read = false;
        this.innerText = "Not Read";
      }
    });

    let read = document.createElement("td");
    read.appendChild(btStatus);
    applyStyle(read,"paddingLeft","10px");
    applyStyle(read,"paddingRight","10px");
    applyStyle(read,"textAlign","center");

    let btnRemove = createButton("X");
    btnRemove.classList.add("btn-delete");
    btnRemove.addEventListener('click',function(e) {
      e.preventDefault;
      var row = this.parentNode.parentNode;
      row.parentNode.removeChild(row);
      deleteBook(book.id);
    });


    let remove = document.createElement("td")
    applyStyle(remove,"textAlign","center");
    remove.appendChild(btnRemove);

    row.appendChild(title);
    row.appendChild(author);
    row.appendChild(pages);
    row.appendChild(read);
    row.appendChild(remove);
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
});

function createButton(text) {
  let btn = document.createElement("button");
  btn.innerText = text;
  return btn;
}

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


function findBook(id) {
  for(var i = 0; i < myLibrary.length; i++) {
    if (myLibrary[i].id === id) {
      return myLibrary[i];
    }
  }
}

function deleteBook(id) {
  var index = -1;
  for(var i = 0; i < myLibrary.length; i++) {
    if (myLibrary[i].id == id) {
       index = i;
       break;
    }
  }
  myLibrary.splice(index,1);
  localStorage.setItem('books', JSON.stringify(myLibrary));

}

function defaultBook() {
  addBookToLibrary(new Book("Lord of Rings", "J. R. R. Tolkien", 1178, "no"))
  addBookToLibrary(new Book("Thinking, Fast and Slow", "Daniel Kahneman", 499, "no"))
  addBookToLibrary(new Book("Winners Take All: The Elite Charade of Changing the World",
                            " Anand Giridharadas", 304, "no"))
  addBookToLibrary(new Book("The Value of Everything: Making and Taking in the Global Economy",
                            "Mariana Mazzucato", 384, "no"))
}

defaultBook();
render();
