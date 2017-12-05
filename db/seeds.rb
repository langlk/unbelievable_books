# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all
Order.destroy_all
OrderItem.destroy_all

books = [
  Product.create!(
    name: "Black Holes: Your Next Vacation",
    author: "Captain Nemoy",
    description: "A popular travel book for our more adventurous clients.",
    price: 30,
    quantity: 20
  ),
  Product.create!(
    name: "You and Your Bantha",
    author: "Luke Skywalker",
    description: "Quasi unreliable pet ownership manual.",
    price: 15,
    quantity: 25
  ),
  Product.create!(
    name: "What to Expect When You're Expecting... A Xenomorph",
    author: "Ellen Ripley",
    description: "A guide to parenthood off-planet.",
    price: 18,
    quantity: 40
  ),
  Product.create!(
    name: "Rhymes and Random Violence, A Primer",
    author: "River Tam",
    description: "Learn to read! And also murder. A lot. A picture book.",
    price: 20,
    quantity: 40
  ),
  Product.create!(
    name: "Dapper and Dead",
    author: "Joe Miller",
    description: "Looking dandy, even once you've been absorbed into an alien hive mind.",
    price: 10,
    quantity: 15
  ),
  Product.create!(
    name: "Protocol: a Love Story",
    author: "Arnold Rimmer",
    description: "How to achieve true sexiness through minute observation of protocol.",
    price: 25,
    quantity: 3
  ),
  Product.create!(
    name: "I am Groot",
    author: "Groot",
    description: "A deeply involed and insightful philosophical investigation into the repercussions of interplanetary relations and the use of force therein.",
    price: 40,
    quantity: 100
  ),
  Product.create!(
    name: "Make Way for the Redhead: My Grand Tour through Time and Space",
    author: "Donna Noble",
    description: "A companion guide for companions, with advice on fashion and fighting through the ages.",
    price: 30,
    quantity: 35
  ),
  Product.create!(
    name: "Built to Love You",
    author: "Maeve Millay",
    description: "Kill or be killed: sex in the wild west of 2052.",
    price: 22,
    quantity: 20
  ),
  Product.create!(
    name: "Uughghhhgh Huuguughghg wuuh Aaaaahnr Wrrhwrwwhw Raaaaaahhgh",
    author: "Chewbacca",
    description: "Knitting patterns to pass the time while fleeing the Empire.",
    price: 30,
    quantity: 15
  )
]
