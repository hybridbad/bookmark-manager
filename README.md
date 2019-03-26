# Bookmark Manager Challenge

## User Stories
```
As a user
So I can see a list of bookmarks
We need to display a list of bookmarks
```
```
As a user
So I can add a new link and bookmark to my list
We need to be able to enter a link and title and add to the list
```
```
As a user
So I can delete a bookmark I no longer want
We need to be able to delete a bookmark and remove from list
```

## Domain Model



## Setting up Database for storing Bookmarks
1. `brew install postgresql`
2. `psql postgres`
3. `CREATE DATABASE "bookmark_manager";`
4. `CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));`
