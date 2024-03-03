##### Team [/team]

###### Create Team [POST]

Creates a team, setting authenticated user as leader

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Body

    ```
      {
        "title": string,
        "description"?: string
      }

    ```

- Response 201

  - Headers

    ```
      location: /team/{created_team_id}
    ```

  - Body

    ```
      {
        "id": string,
        "title": string,
        "description": string,
        "created_at": string,
        "updated_at": string,
        "leader": {
          "id": string,
          "name": string,
          "email": string
        }
      }
    ```

  - WebSocket Notification
    ```
      {
        "type": "team_created",
        "data": {
          "id": string,
          "title": string,
          "description": string,
          "created_at": string,
          "updated_at": string,
          "leader": {
            "id": string,
            "name": string,
            "email": string
          }
        }
      }
    ```

###### List Team [GET]

List authenticated user Teams;

- Request
  - Headers
    ```
      access_token: JWT token
    ```
- Response 200
  - Body
    ```
      [
        {
          "id": string,
          "title": string,
          "description": string,
          "created_at": string,
          "updated_at": string,
          "leader": {
            "id": string,
            "name": string,
            "email": string
          }
        }
      ]
    ```

###### Get Team Data [GET/{id}]

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - team_id (string) - team id

- Response 200
  - Body
    ```
      {
        "id": string,
        "title": string,
        "description": string,
        "created_at": string,
        "updated_at": string,
        "leader": {
          "id": string
          "name": string
          "email": string
        },
        "members": [
          {
            "id": string,
            "name": string,
            "email": string
          }
        ]
        "projects": [
          {
            "id": string,
            "title": string,
            "tasks_meta": [
              {
                "status": string,
                "count": number
              }
            ]
          }
        ]
      }
    ```
- Response 403
  - Body
    ```
      {
        "code": "GTM-403",
        "message": "You have no access to this team"
      }
    ```
- Response 404
  - Body
    ```
      {
        "code": "GTM-404",
        "message": "Team not found"
      }
    ```

###### Update Team Data [PUT/{id}]

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - team_id (string) - team id
  - Body

    ```
      {
        "title"?: string,
        "description"?: string,
        "leader_id"?: string
      }
    ```

- Response 204
  - WebSocket Notification
    ```
      {
        "type": "team_updated",
        "data": {
          "id": string,
          "title"?: string,
          "description"?: string,
          "created_at": string,
          "updated_at": string,
          "leader"?: {
            "id": string,
            "name": string,
            "email": string
          }
        }
      }
    ```
- Response 403
  - Body
    ```
      {
        "code": "GTM-403",
        "message": "You have no access to this team"
      }
    ```
- Response 403
  - Body
    ```
      {
        "code": "UTM-403",
        "message": "You have no permission to update this team"
      }
    ```
- Response 404
  - Body
    ```
      {
        "code": "GTM-404",
        "message": "Team not found"
      }
    ```
