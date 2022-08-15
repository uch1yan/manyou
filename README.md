# README

| User            |         |
| --------------- | ------- |
| id (PK)         | integer |
| name            | string  |
| password_digest | integer |

| Task     |         |
| -------- | ------- |
| id (PK)  | integer |
| title    | string  |
| content  | text    |
| deadline | string  |
| priority | integer |
| status   | string  |
| user_id  | integer |
| label_id | integer |

| Task_labels |         |
| ----------- | ------- |
| id (PK)     | integer |
| user_id     | integer |
| task_id     | integer |

| label      |         |
| ---------- | ------- |
| id (PK)    | integer |
| label_name | string  |
