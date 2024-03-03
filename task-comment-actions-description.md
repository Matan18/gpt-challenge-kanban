##### Task Comment

###### Create Task Comment [POST/project/{project_id}/task/{task_id}/comment]

Creates a task comment, setting task_id based on id parameter

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - project_id (string) - project id
    - task_id (string) - task id
  - Body

    ```
      {
        "comment": string,
      }
    ```

- Response 201

  - Header

    ```
    location: /project/{id}/task/{task_id}/comment/{comment_id}
    ```

  - Body

    ```
      {
        "id": string,
        "task_id": string,
        "user_id": string,
        "created_at": string,
        "updated_at": string,
        "comment": string
      }
    ```

  - WebSocket Notification
    ```
      {
        "type": "task_comment_created",
        "data": {
           "id": string,
          "task_id": string,
          "user_id": string,
          "created_at": string,
          "updated_at": string,
          "comment": string
        }
      }
    ```

###### Get Task Comment [GET/project/{project_id}/task/{task_id}/comment/{comment_id}]

Creates a task comment, setting task_id based on id parameter

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - project_id (string) - project id
    - task_id (string) - task id
    - comment_id (string) - comment id

- Response 200

  - Body

    ```
      {
        "id": string,
        "task_id": string,
        "comment": string,
        "user_id": string,
        "created_at": string,
        "updated_at": string
      }
    ```

###### Update Task Comment [GET/project/{project_id}/task/{task_id}/comment/{comment_id}]

Creates a task comment, setting task_id based on id parameter

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - project_id (string) - project id
    - task_id (string) - task id
    - comment_id (string) - comment id
  - Body

    ```
      {
        "comment": string,
      }
    ```

- Response 204
  - WebSocket Notification
    ```
      {
        "type": "task_comment_updated",
        "data": {
          "id": string,
          "task_id": string,
          "user_id": string,
          "created_at": string,
          "updated_at": string,
          "comment": string
        }
      }
    ```
- Response 403
  - Body
    ```
      {
        "code": "GP-403",
        "message": "You have no access to this project"
      }
    ```
- Response 404
  - Body
    ```
      {
        "code": "GP-404",
        "message": "Project not found"
      }
    ```
