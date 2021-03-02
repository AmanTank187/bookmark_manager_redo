# bookmark_manager_redo

## User Stories

As a user\
So i can go to sites quickly,\
I would like to see a list of bookmarks.

As a user\
So i'm not restricted to a certain bookmarks,\
I'd like to be able to add a bookmark.

As a user\
So my page is not cluttered with multiple bookmarks,\
I would like to be able to delete it.

As a user\
So i can keep up with changes made to a website,\
I'd like to be able to update my bookmarks.

As a user\
So i can remind myself which bookmarks are useful,\
I'd like to be able to make comments on them.

As a user\
So i can organise similar bookmarks together,\
I'd like to be able to tag bookmarks into categories.

As a user\
So i can find a specific bookmark i need\
I would like to filter bookmarks by tag.

As a user\
So my bookmarks can't be changed by someone else\
I'd would like if users could only manage their own bookmarks

---

## Database :

- Type in 'psql postgres' into terminal
- Create database 'CREATE DATABASE bookmark_manager;'
- Connect by '/c bookmark_manager;'
- Create table by doing 'CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));'
