library(DBI)
library(RSQLite)

# Connecting to the database
con <- dbConnect(SQLite(), "library_managment.db")

# Tables in the database 
as.data.frame(dbListTables(con))

# Create admistrator table using query method
create_admin_query <- 
  "      
CREATE TABLE adminstrator (
id TEXT PRIMARY KEY,
first_name TEXT,
username TEXT NOT NULL UNIQUE,
password TEXT NOT NULL
);
"
res <- dbSendQuery(con, create_admin_query)
dbClearResult(res)

# Create a register relation table with a foreign key in the adminstrator table
create_regsiter_query <-
  "
  CREATE TABLE register_relation(
    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id TEXT,
    adminstrator_id TEXT,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (adminstrator_id) REFERENCES adminstrator(id) ON DELETE CASCADE
  );
"
res <- dbSendQuery(con, create_regsiter_query)
dbClearResult(res)

# Inserting data into adminstrator table
insert_admin <- dbSendQuery(con, "INSERT INTO adminstrator(`id`, `first_name`, `username`, `password`) VALUES (?, ?, ?, ?)")
dbBind(insert_admin, list("ADM/ID/11", "Abebe", "abe11", "11abe"))
dbClearResult(insert_admin)

# Accessing the newly created database 
adminstrator <- dbReadTable(con, 'adminstrator')

# Adding a column - last_name to adminstrator table
res <- dbSendQuery(con, "ALTER TABLE adminstrator ADD COLUMN last_name TEXT")
dbClearResult(res)
adminstrator <- dbReadTable(con, 'adminstrator')

# Update the entries in adminstrator
res <- dbSendQuery(con, "UPDATE adminstrator SET last_name='Terefe' WHERE last_name IS NULL or last_name IS ''")
dbClearResult(res)
adminstrator <- dbReadTable(con, 'adminstrator')

# insert more data -- (update insert_admin query first)
# data generated from www.databasetestdata.com
insert_admin <- dbSendQuery(con, "INSERT INTO adminstrator(`id`, `first_name`, `username`, `password`, `last_name`) VALUES (?, ?, ?, ?, ?)")
dbBind(insert_admin, list("ADM/ID/12", "Courtney", "Haley", "officiis@et@atque", "Bosco"))
dbBind(insert_admin, list("ADM/ID/13", "Era", "Marjory.jhones", "voluptaem.a.quasi", "Konopelski"))
dbBind(insert_admin, list("ADM/ID/14", "Nitzsche", "Viva_Dicki", "ut|deleniti|culpa", "Eryn"))
dbBind(insert_admin, list("ADM/ID/15", "Brendon", "Uilices", "esse1beate", "Wilderman"))
dbBind(insert_admin, list("ADM/ID/16", "Robyn", "Leora", "voluptatum.nam2quia", "Reichel"))
dbClearResult(insert_admin)

adminstrator <- dbReadTable(con, "adminstrator")

# deleteting a row from adminstrator table
res <- dbSendQuery(con, "DELETE FROM adminstrator WHERE id = 'ADM/ID/16';")
dbClearResult(res)

adminstrator <- dbReadTable(con, "adminstrator")

# summary of the adminstrator database
summary(adminstrator)
str(adminstrator)

# first and last lines in the database 
head(adminstrator, 3)
tail(adminstrator, 3)

# Disconnect and unlink from the database 
dbDisconnect(con)