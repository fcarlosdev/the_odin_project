# Odin Flight Booker Application

This is the implementations of the [Flight Booker Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/building-advanced-forms) from The Odin Project Ruby on Rails course, thatput in practice the knowledge acquired about advanced forms from the same course.

To test the application you need first populate the base with data, what can be
done running the command below:

```
rails db:seed
```
and then

```
rails -s 
```
to run the server and access the app at http://localhost:3000

where after that the application is ready to use.  

## Other Commands that be useful

In case there is any trouble with the database run

```
rails db:migrate:redo
```
to recreate the database or

```
rails db:rollback
```
flollwed from

```
rails db:migrate
```
that has the same effect that the first one.
