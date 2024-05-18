# Backend-Task

This document outlines the API endpoints for the User Story App

### Getting Started

1. **Clone the repository:**

 ```bash
   git clone https://github.com/aminyasser/inova-task.git
   cd Backend-Task
   ```

2. **Install dependencies:**

   ```bash
   bundle install
    ```

3. **Setup database:**
   ```bash
   rails db:migrate
   rails db:seed
   ```

4. **Start the server:**
   ```bash
   rails server
   ```

### Endpoints

**1. Create a Story:**

* **Method:** POST
* **URL:** `/users/:user_id/stories`
* **Request Body:**
  ```json
  {
      "user_id": 1,
      "title": "test",
      "body": "test"
  }
  ```

![ERD](https://github.com/marwan-mohamed12/Backend-Task/assets/40841193/3bed19a1-3545-4b34-a3c5-743060c8833e)


