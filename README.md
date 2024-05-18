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

### ERD

![ERD](https://github.com/marwan-mohamed12/Backend-Task/assets/40841193/3bed19a1-3545-4b34-a3c5-743060c8833e)

### Endpoints

**1. Create a Story:**

* **Method:** POST
* **URL:** `/stories`
* **Request Body:**
  ```json
  {
      "user_id": 1,
      "title": "test title",
      "body": "test body"
  }
  ```

* **Response:**
  * On success: Returns the created story object.
  * On failure: Returns an error message with status code 400.


**2. Get User's Stories:**

* **Method:** GET
* **URL:** `/users/{user_id}/stories`
* **Parameters:**
  * `{user_id}`: User ID
* **Response:**
  * On success: Returns a list of stories paginated belonging to the specified user.
  * On failure: Returns an error message with status code 404 if the user is not found.


**3. Get Top Stories:**

* **Method:** GET
* **URL:** `/stories/top_stories`
* **Response:**
  * On success: Returns a list of top stories based on the average number of reviews and ratings.
  * On failure: Returns an empty list if no stories are found.


**4. Create a Review for a Story:**

* **Method:** POST
* **URL:** `/stories/:story_id/reviews`
* **Parameters:**
  * `{story_id}`: Story ID
* **Request Body:**
  ```json
  {
      "user_id": 1,
      "comment": "test comment",
      "rating": 1
  }
  ```
* **Response:**
  * On success: Returns the created review object.
  * On failure: Returns an error message with status code 400.


**Error Handling:**

The API returns standard HTTP status codes for errors. For example, a 404 status code indicates that the resource was not found.



