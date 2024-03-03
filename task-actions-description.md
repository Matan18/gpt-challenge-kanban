##### Task

###### Create Task [POST/project/{project_id}/task]

Creates a task, setting project_id based on project_id parameter

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - project_id (string) - project id
  - Body

    ```
      {
        "title": string,
        "description": string,
        "status"?: StatusType,
        "assignee"?: string,
        "dueDate"?: date,
        "priority"?: string,
        "tags"?: string[],
        "custom_fields"?: [
          {
            "custom_field_id": string,
            "title": string,
            "value": string
          }
        ]
      }
    ```

- Response 201

  - Header

    ```
    location: /project/{id}/task/{created_id}
    ```

  - Body

    ```
      {
        "id": string,
        "project_id": string,
        "title": string,
        "description": string,
        "status": StatusType,
        "assignee"?: string,
        "dueDate"?: date,
        "priority"?: string,
        "tags": string[],
        "custom_fields": [
          {
            "custom_field_id": string,
            "title": string,
            "value": string
          }
        ]
      }
    ```

  - WebSocket Notification
    ```
      {
        "type": "task_created",
        "data": {
          "id": string,
          "project_id": string,
          "title": string,
          "description": string,
          "status": StatusType,
          "assignee"?: string,
          "dueDate"?: date,
          "priority"?: string,
          "tags": string[],
          "custom_fields": [
            {
              "custom_field_id": string,
              "title": string,
              "value": string
            }
          ]
        }
      }
    ```

###### Get Task [GET/project/{project_id}/task/{task_id}]

Creates a task comment, setting task_id based on id parameter

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - project_id (string) - project id
    - task_id (string) - task id

- Response 200

  - Body

    ```
      {
        "id": string,
        "project_id": string,
        "title": string,
        "description": string,
        "status": StatusType,
        "assignee"?: string,
        "dueDate"?: date,
        "priority"?: string,
        "tags": string[],
        "custom_fields": [
          {
            "custom_field_id": string,
            "title": string,
            "value": string
          }
        ],
        "comments": [
          {
            "id": string,
            "comment": string,
            "user_id": string,
            "created_at": string,
            "updated_at": string
          }
        ]
      }
    ```

###### Update Task [GET/project/{project_id}/task/{id}]

Update a task title

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - project_id (string) - project id
    - id (string) - task id
  - Body

    ```
      {
        "title"?: string,
        "assignee"?: string,
        "description"?: string,
        "status"?: StatusType,
        "dueDate"?: date,
        "priority"?: string,
        "tags"?: string[],
        "custom_fields"?: [
          {
            "custom_field_id": string,
            "title": string,
            "value": string
          }
        ]
      }
    ```

- Response 204
  - WebSocket Notification
    ```
      {
        "type": "task_updated",
        "data": {
          "id": string,
          "project_id": string,
          "title": string,
          "description": string,
          "status": StatusType,
          "assignee"?: string,
          "dueDate"?: date,
          "priority"?: string,
          "tags": string[],
          "custom_fields": [
            {
              "custom_field_id": string,
              "title": string,
              "value": string
            }
          ]
        }
      }
    ```
- Response 400
  - Body
    ```
      {
        "code": "UT-400",
        "message": "No data for update"
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
