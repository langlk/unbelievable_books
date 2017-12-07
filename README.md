# Unbelievable Books

### _Epicodus Project in Ruby on Rails, December 4, 2017_

### By Kelsey Langlois & L. Devin MacKrell

## Description

_This is a mock website for an online book store. It has basic user authentication, so that only logged in users may review products, and only administrators can create, edit, and delete products._

## Installation and Setup

To install on your own machine, follow the instructions below:

* Clone this repository.
* Create a ```.env``` file and format as follows:
  ```
  PUBLISHABLE_KEY='[Your Stripe Publishable Key]'
  SECRET_KEY='[Your Stripe Secret Key]'

  CURRENCYLAYERKEY='[Your Currency Layer Key]'
  AVATAX_KEY='[Your Avatax API Key]'
  ```  
  * You will need to acquire API keys for [Stripe](https://stripe.com/docs), [AvaTax](https://developer.avalara.com/avatax/dev-guide/) and [Currency Layer](https://currencylayer.com/).
* Run the following commands in the project root directory:
  ```
  bundle update
  rake db:setup
  rails db:seed
  rails s
  ```
* Open ```localhost:3000``` in your web browser
* **To give an account admin privileges:**
  * In the project root run ```rails c```
  * Then run:
    ```ruby
    User.find_by(email: "[account email address]").update(admin: true)
    ```
  * The account will now have admin access to the app.

## Specifications

* Products  
  * All users may view products
  * Administrators may add, edit, and delete products
  * Administrators may set a product on sale until a specified date
  * Users can raincheck a product for later purchase
* Accounts
  * Accounts and Users have a one-to-one association
  * Administrators may change an account's "Preferred" status
    * Preferred accounts receive a 10% discount on non-sale items
* Users
  * Users may be either standard user or Admin
  * Users may log in with email and password
* Orders
  * Orders are created and edited when a user updates or purchases their cart
  * Orders are charged using [Stripe](https://stripe.com/docs)
  * At checkout, total order cost is displayed in the following currencies:
    * US Dollars
    * Canadian Dollars
    * Euros
    * Great British Pounds
    * Polish Złoty
  * At checkout, Seattle sales tax is added to the order total
  * An order's status changes from "Cart" to "Placed" when user is charged for the order at checkout
  * Orders may not be placed if there is not sufficient stock for all order items
  * User receives a confirmation email once their order has been placed
* Order Items
  * Order items can be moved from Raincheck to Cart
  * Order items reserve the price of the product at time they are added to cart
* Reviews
  * Reviews cannot be added unless user has purchased the product
  * Users may edit and delete their own reviews
  * Administrators may delete any user reviews
  * All users can view reviews

## To Do:

* Confirmation email once order shipped

* Shipping and taxes (APIs)
  * X Sales tax added and calculated for shopping cart (Avalara's Tax Rate API)
  * USPS's shipping rate for a product (rate calculator API. XML not JSON. Can also use Stripe API)

* Random API of our choice

* AJAX
  * Click thumbnail image to see full-size image in lightbox
  * Sort product results without refresh
  * Paginate results
    * Change page without refresh
  * Admin:
    * Product CRUD without refresh
    * Mark items as featured without refresh

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) or [ldmackrell@gmail.com](mailto:ldmackrell@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Bootstrap
* Devise
* Stripe
* AJAX

### License

Copyright (c) 2017 **Kelsey Langlois & L. Devin MacKrell**

*This software is licensed under the MIT license.*
