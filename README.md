## R-Database
Assignment on accessing and manipulating database within *R*. Here is a description of files included in the repo


* library_managment.db is an SQLite database. You can open the db using /SQLiteStudio/
* library.sql  is used to create some of the tables in the database. These are book, librarian, user, lends_transaction and reserves_transaction tables. The lends_transaction and reserves_transaction tables are relationship tables with foreign key in book, librarian and user tables. 
```sql
CREATE TABLE book (
    ISBN TEXT PRIMARY KEY,
    title TEXT,
    author TEXT,
    publisher TEXT,
    number_of_copy INTEGER,
    book_status INTEGER DEFAULT 0
);
```

> Inserting data into lend_transaction

```sql
INSERT INTO lend_transaction (
 transaction_id,
 librarian_id,
 book_isbn)
VALUES
 ( 1,
  "RTA/ID/00",
  "1491910399");
```


* CRUD.R is a script file for manipulating the above mentioned library_managment.db database. All the steps required in the assignment questions are included with a comment. 

