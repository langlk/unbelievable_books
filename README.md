# Unbelievable Books

### _Epicodus Project in Ruby on Rails, December 4, 2017_

### By Kelsey Langlois & L. Devin MacKrell

## Description

_This is a mock website for an online book store. It has basic user authentication, so that only logged in users may review products, and only administrators can create, edit, and delete products._

## Installation and Setup

To install on your own machine, follow the instructions below:

* Clone this repository.
* Run the following commands in the project root directory:
  ```
  bundle update
  rake db:setup
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
  * Name
  * Description
  * List_Price
  * Quantity
  * Discount
  * Featured
  * Author
* Users
  * Name
  * email
  * Password/ Password Confirmation
* Accounts
  * account_id
  * user_id
* Order Items
  * order_id
  * product_id
  * quantity
  * reserved_price
* Orders
  * account_id
  * price_total
  * status
  * Raincheck
* Reviews
  * account_id
  * product_id
  * content

To Do:

* Admin
  * CRUD for products
  * feature product(s)
  * Price change (edit)
  * Discount (edit product)
  * Shipping and taxes (APIs)
  * Time discount is in effect
  * Discount for preferred customers
  * Out of Stock order block
  * Customer reviews on purchased products

* User
  * Shopping cart (add & remove, view)
  * cleared cart upon purchase
  * display cart total (quantity & total cost). Navbar
  * List discounted items on site
  * Pay online (API)
  * Sign up/ create account
  * Order history
  * Tag products "raincheck" --> viewable in cart
  * Ability to move raincheck items into order proper
  * View quantity (less than ten of product)
  * Reviews (view & add)
  * Access cart via account login
  * Confirmation email upon completed order (Mailing)
    * Confirmation email once order shipped

* User API
  * Pay for purchases online (Stripe API)
  * Calculate cost of order in non-dollar currency (Currency Layer API)
  * Random API of our choice

* Admin API   
  * Sales tax added and calculated for shopping cart (Avalara's Tax Rate API)
  * USPS's shipping rate for a product (rate calculator API. XML not JSON. Can also use Stripe API)

<!--
* Unauthenticated users may:
  * View all products
  * View product details
  * View product reviews
* Authenticated users may do all of the above as well as:
  * Create reviews
  * Edit and delete their own reviews
* Authenticated admins may do all of the above as well as:
  * Create, edit, and delete products.
  * Delete user reviews. -->

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) or [ldmackrell@gmail.com](mailto:ldmackrell@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Bootstrap
* Devise
* Paperclip

### License

Copyright (c) 2017 **Kelsey Langlois & L. Devin MacKrell**

*This software is licensed under the MIT license.*
