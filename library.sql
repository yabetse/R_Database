CREATE TABLE book (
    ISBN TEXT PRIMARY KEY,
    title TEXT,
    author TEXT,
    publisher TEXT,
    number_of_copy INTEGER,
    book_status INTEGER DEFAULT 0
);

CREATE TABLE librarian (
    id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE user (
    id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE lend_transaction(
    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    librarian_id TEXT,
    book_isbn TEXT,
    FOREIGN KEY (librarian_id) REFERENCES librarian(id),
    FOREIGN KEY (book_isbn) REFERENCES book(ISBN)
);

CREATE TABLE reserve_transaction(
    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id TEXT,
    book_isbn TEXT,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (book_isbn) REFERENCES book(ISBN)
);

-- inserting into table book
INSERT INTO book (
 ISBN,
 title,
 author,
 publisher,
 number_of_copy,
 book_status)
VALUES
 ( "0545596270",
 "Harry Potter Complete Book Series Special Edition Boxed Set",
 "J.K. Rowling",
 "Scholastic Inc",
 11,
 1),
 ("1491910399",
 "R for Data Science: Import, Tidy, Transform, Visualize, and Model Data",
 "Hadley Wickham , Garrett Grolemund",
 "O'Reilly Media",
 5,
 0),
  ("0060555661",
 "The Intelligent Investor: The Definitive Book on Value Investing. A Book of Practical Counsel",
 "Benjamin Graham , Jason Zweig",
 "HarperBusiness",
 20,
 1),
  ("1718116209",
 "How to Draw Fortnite: Learn to Draw Skins (Unofficial)",
 "Osie Publishing",
 "Independently published",
 33,
 1),
 ("1680502530",
 "Seven Databases in Seven Weeks: A Guide to Modern Databases and the NoSQL Movement",
 "Luc Perkins , Eric Redmond , Jim Wilson",
 "Pragmatic Bookshelf",
 6,
 1);
 
 -- inserting into table librarian
INSERT INTO librarian (
 id,
 first_name,
 last_name,
 username,
 password)
VALUES
 ( "RTA/ID/00",
 "Abebe",
 "Kebede",
 "Abebe01",
 "abe123456"),
 ( "RTA/ID/11",
 "Ashenafi",
 "Mandefro",
 "Ashenafi",
 "HTCOnEM7");
 
  -- inserting into table user
INSERT INTO user (
 id,
 first_name,
 last_name,
 username,
 password)
VALUES
 ( "ATR/9089/07",
 "Biruk",
 "Abera",
 "Adera@Biruk",
 "B@rc@lona"),
 ( "ATR/8089/06",
 "Nathan",
 "Tegaye",
 "Nate",
 "N@t@n12#3");
 
  
-- inserting into table lend_transaction
INSERT INTO lend_transaction (
 transaction_id,
 librarian_id,
 book_isbn)
VALUES
 ( 1,
  "RTA/ID/00",
  "1491910399");

-- inserting into table reserve_transaction
INSERT INTO reserve_transaction (
 transaction_id,
 user_id,
 book_isbn)
VALUES
 ( 1,
 "ATR/9089/07",
 "1491910399");
