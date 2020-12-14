# Books Galore
This is a simple web application made using Ruby 2.7 on Rails 5.2.4.4

# Summary
This Ruby on Rails app is a books subscription service which lets the user choose a suitable monthly-paid plan out of three options which differ in terms of downloads allowed per month. The user is represented a library with a selection of books when they first launch the website, after signing up and choosing their plan they will be able to browse throught the latest titles available, add books to their personal virtual bookcase, and download them.

# Notable Gems used
* Stripe Billing: in this app I used Stripe Billing's API for payments. Using my Stripe Billing account I created a product ID  and used the assigned public and secret API keys to link each subscription plan to its speficifc id key. And I used the encrypted credentials file to store these keys.

* Active Storage

* Devise: allows us to redirect the user upon successfully signing up.

* Webpacker

* SimpleForm

* Bootstrap

* JQuery

* Mini Magick

# Installation

* Download the zip file, extract it and `cd` to that directory.

* `Bundle install` in order to install all the required gems

* `rails db:migrate'

* Then `rails s` to run it!

# Notes

* In order to add books to the main library to be represented to the user, you have to log in as admin. To do that:

- First create an account and go through the signup and subscription process on the app
- start rails console `rails c` 
- `user = User.last` which will present you the details of the user that signed in last 
- `user.admin = true` to set the user as admin
- `user.save`

You will then see a new 'New Book' button appear which allows the admin to add titles with thumbnails, author nae and synopsis/description.
