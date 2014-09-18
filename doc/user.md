### User

| Endpoint                                  | Description        |
| ----------------------------------------- | ------------------ |
| [POST /users](/doc/session.md#post-users) | Create a new user. |

#### `POST /users`

##### Parameters

| Name     | Required? | Type   | Description                |
| -------- | --------- | ------ | -------------------------- |
| email    | Yes       | String | Email for the new user.    |
| password | Yes       | String | Password for the new user. |

##### Example Request 

```bash
curl -H "Content-Type: application/json" -d '{"email": "sample@example.org", "password": "password"}' -X POST "http://recruiting-api.nextcapital.com/users"
```
##### Example Response

```json
{
    "api_token": "2FxozzbPWxzDTedCrixy",
    "email": "sample@example.org",
    "id": 123,
    "todos": []
}
```
