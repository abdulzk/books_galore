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

# Screenshots

<img width="1360" alt="Screenshot 2020-12-14 at 12 11 30" src="https://user-images.githubusercontent.com/28578569/103176823-ede7ee80-486c-11eb-81b9-369cacbe6e27.png">
<img width="1359" alt="Screenshot 2020-12-14 at 12 11 46" src="https://user-images.githubusercontent.com/28578569/103176865-3e5f4c00-486d-11eb-96ec-78dc96d4be38.png">
<img width="1359" alt="Screenshot 2020-12-14 at 12 14 59" src="https://user-images.githubusercontent.com/28578569/103176884-58009380-486d-11eb-93b5-dabec4bf8006.png">
<img width="1358" alt="Screenshot 2020-12-14 at 12 13 27" src="https://user-images.githubusercontent.com/28578569/103176898-6a7acd00-486d-11eb-9402-c611da53083b.png">
<img width="1358" alt="Screenshot 2020-12-14 at 12 13 45" src="https://user-images.githubusercontent.com/28578569/103176910-8a11f580-486d-11eb-8ed8-426f3747b993.png">
<img width="1360" alt="Screenshot 2020-12-14 at 12 14 22" src="https://user-images.githubusercontent.com/28578569/103176915-9ac26b80-486d-11eb-8e2f-542a4fe898cf.png">
<img width="1359" alt="Screenshot 2020-12-14 at 12 15 53" src="https://user-images.githubusercontent.com/28578569/103176925-ad3ca500-486d-11eb-9816-beaeffe125cc.png">
<img width="1357" alt="Screenshot 2020-12-14 at 12 16 43" src="https://user-images.githubusercontent.com/28578569/103176936-c2b1cf00-486d-11eb-9305-8cdf71b793eb.png">
