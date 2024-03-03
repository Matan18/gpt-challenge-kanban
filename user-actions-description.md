###### GET [/auth/sing-in]

- Response 201
  - Headers
    ```
      access_token: JWT token
    ```
  - Body
    ```
      {
        "access_token": string,
        "id_token": string,
        "scope": string,
        "expires_in": number,
        "token_type": "Bearer"
      }
    ```

```mermaid
---
title: User SignIn/Create User
---
sequenceDiagram
    Actor User
    participant Rust
    participant Auth0
    User->>Rust: SignUp
    Rust->>Auth0: Authorize
    Auth0->>User: Ask Permission
    alt granted
      User->>Auth0: Permited
      Auth0->>Rust: code
      Rust->>Rust: validate user email
      Rust->>User: access_token
    else denied
      User->>Auth0: Denied
      Auth0->>Rust: Denied
      Rust->>User: error (unauthorized)
    end
```

###### Get User data [GET/me]

- Request
  - Headers
    ```
      access_token: JWT token
    ```
- Response 200

  - Body
    ```
      {
        "id": string,
        "name": string,
        "email": string
      }
    ```

###### Update User Name [GET/me]

- Request

  - Headers
    ```
      access_token: JWT token
    ```
  - Body

    ```
      {
        "name": string
      }

    ```

- Response 204

```mermaid
---
title: User Update Name
---
sequenceDiagram
    Actor User
    participant Rust
    User->>Rust: Update Name
```
