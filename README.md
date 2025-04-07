# Task Manager with Image Upload & Background Jobs

A simple rails application that allows users to manage tasks with image uploads and background job processing.

## Features

- Create, read, update, and delete tasks
- Upload images for each task
- Background job processing for task creation notifications
- Filter tasks by completion status
- Responsive UI with Tailwind CSS
- Basic API endpoint for tasks
- Real-time updates using Turbo/Hotwire.
- RSpec tests for model and controller reliability.

## Tech Stack

- Ruby 3.0+
- Rails 8.0+
- PostgreSQL
- Use Active Storage
- Use Active Job
- Node.js 23.10.0
- RSpec for testing
- yarn Latest

## Clone the repository

- clone https://github.com/Dev-Mastermind/task_manager.git
- cd task_manager

## Install dependencies

- bundle install
- yarn install

## Database Setup

- brew install postgresql
- brew services start postgresql

## Create the database

- rails db:create
- rails db:migrate


## Start the development server

- bin/dev

## Running Tests

- bundle exec rspec