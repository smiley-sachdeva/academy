# Learnig Academy

Learning Academy is a platform for managing learning paths, courses, and talents. This project provides an API for interacting with these entities, enabling administrators to create, update, delete and monitor the progress of talents as they progress through learning paths and courses.

## Prerequisites

Before running this project, make sure you have the following prerequisites installed on your system:

- Ruby version 2.7.7
- Rails version 6.0.6
- PostgreSQL
  
# Features

* **Learning Paths**: Create and manage learning paths, which are curated sequences of courses designed to help talents achieve specific learning goals.
* **Courses**: Define and organize courses within learning paths, each with its own name and author(s).
* **Talents**: Manage talents enrolled in learning paths, track their progress through courses, and update their statuses as needed.
* **Status Tracking**: Talents progress through courses is tracked with statuses such as "Not started", "In progress", or "Completed".
* **API Documentation**: Comprehensive API documentation is provided for developers to integrate with the Learning Academy platform.

# Installation
To run this project locally, follow these steps:

- Clone this repository to your local machine.
- Install dependencies by running `bundle install`.
- Set up the database by running `rails db:create` and `rails db:migrate`.
- Start the Rails server by running `rails server`.

# Usage

Use the provided API endpoints to interact with learning paths, courses, and talents.
Refer to the API documentation for detailed information on each endpoint and its usage.

# API Documentation
Detailed documentation for the Learning Academy API can be found [here](https://documenter.getpostman.com/view/33525206/2sA2xjzrCk).
