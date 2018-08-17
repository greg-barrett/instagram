Instagram Clone

Aim: The aim of this project was to create an app which would show case all the skills I have learnt after following The Odin Project

Description

This app is a clone of a popular website called instagram. If you haven't heard of Instagram you probably never will becuase my version is likely to eclipse it over the coming weeks.
Jokes aside...

Stack
Ruby on Rails
Vanilla JS
Sass

Authentication
Devise

Image Uploads
Carrierwave

Online storage
Amazon AWS

Hosting
Heroku
https://insteadgram1.herokuapp.com/users/sign_in
Login : jblanco
password : 12345q

Features
Users authenticate with either their email address or username and password
Users can update their personal information
Users can follow other users- without permission via AJAX requests
Users can be followed
Users can upload and change their profile image
Users can create posts with an image, caption and hashtags
Users can comment and like posts via AJAX requests
Users can search for other users by first name
Users have access to posts in several ways
  Their feed consists of the most recent posts of the users they follow
  Users can also view all the posts which they have liked
  Users can also search for posts by hashtag



I am really happy with how this project turned out. I have been able to set up complex data models (which work!) and make a good looking front end. The site is not made for mobile but media queries have been used to give it a reasonable appearence.


There are endless features which I could add but it is time to move onto my next project. In the future I would like to add testing. This is something I have neglected in order to get the project to completion but I'd feel happier if I had tested along the way. I'm also a little disapointed how little js I;ve needed for this project but would like to look into how I could integrate vue compnents into Rails in the future.

Other imporvements
Search by full name, username or email and get non exact matches
Add basic image filters for the posts
regex for passwords and usernames
Total refactor of partials and css which have become a little...damp
Revise routes to bare essentials
Add post upload to header
Move the search feature out of the Tags controller...Shhhh! Don't tell anyone!
