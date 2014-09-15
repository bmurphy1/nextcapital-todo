# TODO JSON Server

## Overview

The TODO API enables users to create and manage TODOs.

## API

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
