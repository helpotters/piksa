# Piksa Management Inc.

This project is bonafide pizza management system for your pizza pie needs built with Ruby on Rails. It allows users with different roles to manage pizzas and toppings. The system supports two roles:
- **StoreOwner**: Can create, update, and delete both pizzas and toppings.
- **PizzaChef**: Can create, update, and delete pizzas but cannot manage toppings.

---

## Table of Contents
1. [Requirements](#requirements)
2. [Setup and Installation](#setup-and-installation)
3. [Running the Application Locally](#running-the-application-locally)
4. [Database Setup](#database-setup)
5. [Running Tests](#running-tests)
6. [Seeded Users for Testing](#seeded-users-for-testing)
7. [Technologies Used](#technologies-used)

---

## Requirements

To run this application locally, ensure you have the following tools installed:

- **Ruby** (version 3.x or higher)
- **Rails** (version 6.x or higher)
- **Node.js** (version 12.x or higher)
- **Yarn**
- **PostgreSQL** (or an alternative database such as SQLite3)

---

## Setup and Installation

Follow these steps to get the project running locally:

### 1. Clone the repository:

```bash
git clone git@github.com:helpotters/piksa.git
cd piksa
```

### 2. Install dependencies:

```bash
bundle install
yarn install
```

### 3. Setup environment variables:

Create a `.env` file or use the `config/database.yml` to configure your database credentials if you are using a PostgreSQL setup. Alternatively, you can modify it to use SQLite3 for a simpler local environment.

### 4. Database Setup:

Before running the application, you need to set up the database:

```bash
rails db:create
rails db:migrate
rails db:seed
```

- **`rails db:create`**: Creates the development and test databases.
- **`rails db:migrate`**: Runs all necessary migrations.
- **`rails db:seed`**: Seeds the database with some sample data, including pizzas, toppings, and users for testing.

---

## Running the Application Locally

To start the Rails server and run the application locally, use the following command:

```bash
rails server
```

Visit `http://localhost:3000` in your web browser to access the application.

---

## Running Tests

The project uses **RSpec** for testing. To run the test suite, first make sure your test database is set up:

```bash
rails db:migrate RAILS_ENV=test
```

Then, you can run all tests with the following command:

```bash
bundle exec rspec
```

This will run all feature and unit tests, covering the requirements of the stories.

---

## Seeded Users for Testing

For quick testing, the seed file creates two users with specific roles:

### StoreOwner Credentials:
- **Email**: `owner@pizza.com`
- **Password**: `password123`
- **Role**: StoreOwner
  - This user has full access to manage pizzas and toppings.

### PizzaChef Credentials:
- **Email**: `chef@pizza.com`
- **Password**: `password123`
- **Role**: PizzaChef
  - This user can manage pizzas but cannot create, update, or delete toppings.

You can log in with these credentials after running the `rails db:seed` command and test the role-based features of the application.

---

## Technologies Used

- **Ruby on Rails**: Web framework for building the application.
- **PostgreSQL**: Database for storing pizzas, toppings, and users (SQLite3 can also be used).
- **Tailwind CSS + DaisyUI**: For styling the application and providing a clean UI.
- **RSpec**: Testing framework for unit and feature tests.

---

### Notes:

- Ensure you have PostgreSQL running or configure the app to use SQLite3 for quicker local development.
- The seeded data provides a good baseline for testing roles and permissions.
  
By following the instructions in this README, you should be able to run the application, test its functionality, and explore its role-based features.
