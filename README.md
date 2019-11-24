# README

Here are the necessary steps to get the
application up and running.

*Ruby version*

2.6.3

*Clone repository*

- run `git@github.com:ctln12/rails-mister-cocktail.git name-of-folder` in the terminal

*Database*

- run `rails db:create` in the terminal

- run `rails db:migrate` in the terminal

- run `rails db:seed` in the terminal

*View locally*

- run `rails server` in the terminal

- go to `localhost:3000` in your browser

- use the commands `ctrl + C` to stop the server

*Deployment on Heroku*

- sign up on [heroku](https://id.heroku.com/signup)

- run `brew install heroku/brew/heroku` in the terminal to install on OS X

- run `heroku login` in the terminal to login

- run `heroku create $YOUR_APP_NAME -- region eu` to create an Heroku app

- run `git push heroku master` to push your code to Heroku

- run `heroku run rails db:migrate`

- run `heroku run rails db:seed`

- run `heroku open` to open the application in your browser
