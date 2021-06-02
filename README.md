# Maker's Week 4: Weekly challenge
This challenge was the fourth of my Maker's weekly challenges, coded in pairs with a randomised partner each day.
This week is where I would say the difficulty noticeably stepped up, with database interactions being more complex than previous weeks.
The learning objectives for this week were:

* Built a simple web app with a database attached to allow permanence
* Explain the basics of how databases work and how to use SQL to interact with them
* Object Relational Mapping (ORM) and manually writing a SQL interface with ruby
* RESTful routes




# Bookmark Manager

Instructions
-------
* DB instructional files are recorded in `./db/migrations` , please follow these to setup your database to mirror ours 
  * Run PSQL in your terminal
  * Create the databse using `CREATE DATABASE bookmark_manager;`
  * Use PQSL command `\c bookmark_manager;` to connect to the databse 
  * Run the commands saved in the migrations files to set up your database accordingly   
  * Create a separate test database called bookmark_manager_test, using the same table listed in https://github.com/MattDawson2020/bookmark-manager/blob/master/db/migrations/01_create_bookmarks_table.sql

User story part 1
----

```
As a user 
So I can catch up on my reading 
I would like to see a list of my bookmarks
```

![alt text](https://github.com/kerrimcm/bookmark-manager/blob/master/Images/Screenshot%202021-04-19%20at%2014.28.03.png)

