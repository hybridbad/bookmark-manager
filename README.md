# Bookmark Manager Challenge

-- Challenge excerpt

You're going to build a bookmark manager. A bookmark manager is a website to maintain a collection of bookmarks (URLs). You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse bookmarks other users have added. You can comment on the bookmarks.

### Instructions

1. `git clone git@github.com:hybridbad/bookmark-manager.git`
2. `cd to cloned dir`
3. `bundle install`
4. Do below database setup for local use and testing if you want.
5. `rackup`
6. In browser of choice `localhost:9292`

### Setting up Database for storing Bookmarks - for local use
1. `brew install postgresql`
2. `psql`
3. `CREATE DATABASE bookmark_manager;`
4. `\c bookmark_manager;`
5. `\i bookmark_local.sql;`

### Setting up test Database for RSpec/cabybara purposes
1. `psql`
2. `CREATE DATABASE bookmark_manager_test;`
3. `\c bookmark_manager_test`
4. `CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));`

Now when running RSpec it will utilize the test database only for testing purposes.


### User Stories
```
As a user
So I can see a list of bookmarks
We need to display a list of bookmarks
```
```
As a user
So I can add a new bookmark to my list
We need to be able to enter a link and add to the list
```
```
As a user
So I can delete a bookmark I no longer want
We need to be able to delete a bookmark and remove from list
```
```
As a user
So I can update existing bookmark in the list
We need to able to access the bookmark and update the information
```
```
As a user
So I can comment on bookmarks in the list
We need to able to click on a bookmark and write a comment and submit
```
```
As a user
So I can tag my bookmarks and categorize them
We need to able to add tags to individual bookmarks
```
```
As a user
So I can find particular bookmarks by category
We need to able to enter a tag and show bookmarks matching the tag
```
```
As a user
So I can manage my own bookmarks
We need to able to log in and give access to own bookmarks
```

### Domain Model

Lifted from walkthrough
![Bookmark Manager domain model](https://github.com/makersacademy/course/blob/master/bookmark_manager/images/bookmark_manager_1.png?raw=true)


