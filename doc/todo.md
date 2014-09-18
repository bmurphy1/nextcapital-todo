### Todo

| Endpoint                                                            | Description         |
| ------------------------------------------------------------------- | ------------------- |
| [GET /users/:user_id/todos](/doc/todo.md#get-usersuser_idtodos)     | Get a user's todos. |
| [POST /users/:user_id/todos](/doc/todo.md#post-usersuser_idtodos)   | Create a todo.      |
| [PUT /users/:user_id/todos/:id](/doc/todo.md#put-usersuser_idtodos) | Update a todo.      |

#### `GET /users/:user_id/todos`

##### Parameters

| Name      | Required? | Type   | Description                        |
| --------- | --------- | ------ | ---------------------------------- |
| user_id   | Yes       | String | ID for the user.                   |
| api_token | Yes       | String | API token for this user's session. |

##### Example Request

```bash
curl -H "Content-Type: application/json" -X GET http://localhost:3000/users/1/todos.json?api_token=KyvGjBHBeDsBeNsXx9XP | python -m json.tool
```

##### Example Response

```json
[
    {
        "description": "Description of todo item 1.",
        "id": 1,
        "is_complete": true
    },
    {
        "description": "Description of todo item 2.",
        "id": 2,
        "is_complete": false
    },
    {
        "description": "Description of todo item 3.",
        "id": 3,
        "is_complete": false
    }
]
```

#### `POST /users/:user_id/todos`

##### Parameters

| Name      | Required? | Type   | Description                               |
| --------- | --------- | ------ | ----------------------------------------- |
| user_id   | Yes       | String | ID for the user.                          |
| api_token | Yes       | String | API token for this user's session.        |
| todo      | Yes       | Object | Object describing the todo to be created. |

##### Example Request 

```bash
curl -H "Content-Type: application/json" -d '{ "api_token": "some_token", "todo": {"description": "A description"}}' -X POST "http://localhost:3000/users/1/todos"
```

##### Example Response

```json
{
    "description": "A description",
    "id": 22,
    "is_complete": false
}
```
#### `PUT /users/:user_id/todos/:todo_id`

##### Parameters

| Name      | Required? | Type   | Description                               |
| --------- | --------- | ------ | ----------------------------------------- |
| user_id   | Yes       | String | ID for the user.                          |
| api_token | Yes       | String | API token for this user's session.        |
| todo      | Yes       | Object | Object describing the todo to be created. |

##### Example Request 

```bash
curl -H "Content-Type: application/json" -d '{"api_token":"EaL-RBx8U8FD9D4wRWP1", "todo": {"description": "Updated description", "is_complete": true}}' -X PUT http://localhost:3000/users/1/todos/22
```

##### Example Response

```json
{
    "description": "Updated description",
    "id": 22,
    "is_complete": true
}
```

#### `GET /users/:user_id/todos/:id`

##### Parameters

| Name      | Required? | Type   | Description                        |
| --------- | --------- | ------ | ---------------------------------- |
| user_id   | Yes       | String | ID for the user.                   |
| api_token | Yes       | String | API token for this user's session. |
| id        | Yes       | String | The id of the todo to show.        |

##### Example Request

```bash
curl -H "Content-Type: application/json" -X GET http://localhost:3000/users/1/todos/1?api_token=KyvGjBHBeDsBeNsXx9XP | python -m json.tool
```

##### Example Response

```json
  {
      "description": "Description of todo item 1.",
      "id": 1,
      "is_complete": true
  }
```
