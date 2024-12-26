This git repo is meant for Cxrus test assignment sent via Win
from 8750 23**

Take note, sql Answer.txt is answer to the 3 sql questions asked.
I used SQL Server, Northwind Database.


For the project, I made use of MySQL Server.
You can restore the server using MySQL.
All scripts are store in database\2024-12-24 cxrus.sql

You will need to install Postman before importing Postman\cxrus.postman.json
Files for testing are stored in this collection.


For the Test Project:
I have distributed codes into 2 portions.

Server 
======================
using Java, JPA.
At present, Hibernate is still having problems,

To run this project, download IntelliJ. Open the server
directory.
Once server project is opened, build it. 
Run the server project.
You can test it using Postman API you imported earlier

Client
======================
For client, you will need to install nodeJS and all its related global
libraries
Inslde the client directory, cxrus\client
execute 
npm install
npm run build
Once successful, execute npm run dev

Once successful, open any browser with Javascript enable.
http://localhost:5173/
You be able to click onto New or the items in the nav panel.

At present, things is still in development process.
Will update soonest
