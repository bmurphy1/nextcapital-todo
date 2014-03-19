### Session

| Endpoint | Description |
| ---- | --------------- |
| [POST /users/sign_in](/doc/session.md#post-userssign_in) | Start a session |
| [DELETE /users/sign_out](/doc/session.md#delete-userssign_out) | End a session |

#### `POST /users/sign_in`

##### Parameters

| Name  | Required? | Type   | Description |
| ----  | --------- | ----   | ----------- |
| email | Yes       | String | Email for the user. |
| password | Yes       | String | Password for the user. |


##### Example Request 

```bash
curl -H "Content-Type: application/json" -d '{"email": "user1@example.org", "password": "password"}' -X POST "http://localhost:3000/users/sign_in"
```

##### Example Response

```json
{
    "api_token": "2FxozzbPWxzDTedCrixy",
    "email": "user1@example.org",
    "id": 1
}
```

#### `DELETE /users/sign_out`

##### Parameters

| Name  | Required? | Type   | Description |
| ----  | --------- | ----   | ----------- |
| user_id | Yes       | String | ID for the user. |
| api_token | Yes       | String | API token for this user's session. |


##### Example Request 

```bash
curl -H "Content-Type: application/json" -d '{"api_token": "some_token", "user_id": 1}' -X DELETE "http://localhost:3000/users/sign_out"
```

##### Example Response

Empty on success
