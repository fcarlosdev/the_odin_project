# MEMBERS ONLY APPLICATION

## Introduction

This is the solution to the [The Odin Project  - Project Authentication](https://www.theodinproject.com/courses/ruby-on-rails/lessons/authentication), that implements the basic behaves of the authentication and authorization on Rails.

## How it works

Basically it has only two models ***Users*** and ***Posts*** where any people can see all posts created even though they are not authenticated, but only registered users can see who created each post, where the signed in users can create new posts.

## How to test

To get sign in it's need to create a user via rails console, because there is no register form, as the example below.

first enter in the Rails console typing:

```
rails -c
```
then copy and paste the follow command and after that you can login in the app.

```
User.create(name:'Foobar', email:'foobar@mail.com', password:'foobar', password_confirmation:'foobar')
```
