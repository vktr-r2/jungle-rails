# Jungle

The Jungle project was made during the Ruby on Rails portion of the Lighthouse Labs bootcamp course. Jungle is designed to be a multi-paged mini e-commerce app that allows users create and sign into accounts,  scroll through an index of products, add them to their shopping cart, and checkout with the integrated Stripe payment processor API.

Admins can also log in to add/edit/remove products from the products list, and add product categories to be displayed on the nav bar.

The project was primarily focused on introducing us to a real world workplace scenario where as a developer you may be asked to work on an app that is written in an unfamiliar language.  Was able to gain experience working with the Ruby on Rails framework, and the Model-View-Controller architectural pattern.  Secondary focus was implementing features using a behaviour-driven development approach.  Tests were written for Rspec and Cypress


## Screenshots

!["Screenshot of Hero Banner and Nav"](https://github.com/vktr-r2/jungle-rails/blob/master/docs/Jungle%20-%20Hero%20Banner%20and%20Nav%20Bar.png?raw=true)

!["Screenshot of Products Index"](https://github.com/vktr-r2/jungle-rails/blob/master/docs/Jungle%20-%20Products%20Index.png?raw=true)

!["Screenshot of Product Page"](https://github.com/vktr-r2/jungle-rails/blob/master/docs/Jungle%20-%20Product.png?raw=true)

!["Screenshot of Checkout Page"](https://github.com/vktr-r2/jungle-rails/blob/master/docs/Jungle%20-%20Checkout%20Page.png?raw=true)

!["Screenshot of Admin Products"](https://github.com/vktr-r2/jungle-rails/blob/master/docs/Jungle%20-%20Admin%20Products%20Page.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server


## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>


## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Rspec
- Cypress
