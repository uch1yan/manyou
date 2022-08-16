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

---

**Heroku デプロイ手順**

---

1. heroku login
2. heroku create
3. git add .
4. git commit -m"heroku deploy"
5. heroku buildpacks:set heroku/ruby
6. heroku buildpacks:add --index 1 heroku/nodejs
7. git push heroku master
8. heroku run rails db:migrate
