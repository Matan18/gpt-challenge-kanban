##### Project [/project]

###### Create Project [POST]

Creates a project, setting authenticated user as leader

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Body

    ```
      {
        "title": string,
        "description": string,
        "team_id": string
      }

    ```

- Response 201

  - Header

    ```
    location: /project/{created_id}
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

###### List Project [GET{?team_id}]

List authenticated user Projects;

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - team_id (optional, string) - team id as project filter

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
          "team_id": string,
          "leader": {
            "id": string,
            "name": string,
            "email": string
          }
        }
      ]
    ```

###### Get Project Data [GET/{id}]

Get authenticated user Project;

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters
    - id (string) - project id

- Response 200

  - Body

    ```
      {
        "id": string,
        "title": string,
        "description": string,
        "created_at": string,
        "updated_at": string,
        "team_id": string,
        "leader": {
          "id": string,
          "name": string,
          "email": string
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

###### Update Project Data [PATCH/{id}]

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters

    - id (string) - project id

  - Body

    ```
      {
        "title"?: string
        "leader_id"?: string
        "description"?: string
      }
    ```

- Response 204
- Response 400
  - Body
    ```
      {
        "code": "UP-400",
        "message": "No data for update"
      }
    ```
- Response 403
  - Body
    ```
      {
        "code": "UP-403",
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

###### Delete Project [DELETE/{id}]

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters

    - id (string) - project id

- Response 204
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

###### Create Custom Fields [PUT/{id}/field]

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters

    - id (string) - project id

  - Body

    ```
      {
        "title": string,
        "field_type": FieldType
      }
    ```

- Response 204
- Response 403
  - Body
    ```
      {
        "code": "UP-403",
        "message": "You have no access to update this project"
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

###### Delete Custom Fields [DELETE/{id}/field/{field_id}]

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Parameters

    - id (string) - project id
    - field_id (string) - custom field id

- Response 204
- Response 403
  - Body
    ```
      {
        "code": "UP-403",
        "message": "You have no access to update this project"
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
