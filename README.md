# NextCapital To-Do List Challenge

As the first step in our interview process, we'd like you to build a small to-do list webapp that integrates with the RESTful JSON API defined in this project.

The API is publicly accessible at http://recruiting-api.nextcapital.com. The API endpoints are documented below.

## Solution Requirements

At a minimum, your users should be able to:

* Sign up
* Log in
* See a list of all their to-dos
* Create new to-dos
* Mark to-dos as complete
* Reorder their to-dos

Please make your app look at least decent. Don't be afraid to write some unit tests as well.

## Technology and Tools

You can accomplish this with whatever technology and tools you want. If you'd like, you can use [this Javascript API client](https://github.com/clarkr/nextcapital-todo-api-client-jquery), but are not required to.

## Submitting

When you're all done, send us:

1. Your source code (preferably on GitHub)
1. A link to your working application

## Above and Beyond

If you're feeling ambitious, feel free to fork this repository and add API routes, fix bugs, or whatever else you want. Please don't modify any existing API endpoints or behavior, though.

## API Endpoints

### Session

| Endpoint | Description |
| ---- | --------------- |
| [POST /users/sign_in](/doc/session.md#post-userssign_in) | Start a session |
| [DELETE /users/sign_out](/doc/session.md#delete-userssign_out) | End a session |

### TODO

| Endpoint | Description |
| ---- | --------------- |
| [GET /users/:user_id/todos](/doc/todo.md#get-usersuser_idtodos)     | Get a user's TODOs|
| [POST /users/:user_id/todos](doc/todo.md#post-usersuser_idtodos)    | Create a TODO|
| [PUT /users/:user_id/todos/:id](/doc/todo.md#put-usersuser_idtodos) | Update a TODO|
| [GET /users/:user_id/todos/:id](/doc/todo.md#get-usersuser_idtodos) | Get a TODO|
