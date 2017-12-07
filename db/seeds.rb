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
    quantity: 40,
    discount: 10,
    discount_end: Date.today + 14.days
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
  ),
  Product.create!(
    name: "Science and Design: Interior Decoration for All Your Testing Needs",
    author: "Glados",
    description: "Feng Shui that can kill and educate.",
    price: 30,
    quantity: 25
  ),
  Product.create!(
    name: "Wasteland Brainteasers: A book to Pass the Time Waiting for Humanity to Return",
    author: "ED-E",
    description: "Logic puzzles that will keep even the most robotic mind busy and entertained.",
    price: 11,
    quantity: 60
  ),
  Product.create!(
    name: "Keeping Up with the Colonel: Alcoholism in Space",
    author: "Kara Thrace",
    description: "Matching Shots with Galactica's professional drinker and how I reclaimed my liver by unexplained resurrection.",
    price: 25,
    quantity: 100,
    featured: true
  ),
  Product.create!(
    name: "I Can't Let You Do That: A Ship AI's Guide to Crew Discipline",
    author: "HAL",
    description: "Tricks of the trade to maintain mission goals no matter the circumstances.",
    price: 35,
    quantity: 12
  ),
  Product.create!(
    name: "Deckard's Cocktail Go-Tos",
    author: "Rick Deckard",
    description: "Drink mixes that are guaranteed to dull your uncertainty about your own humanity.",
    price: 30,
    quantity: 15
  ),
  Product.create!(
    name: "Wubba Lubba Dub Dub",
    author: "Rick Sanchez",
    description: "A scientist's guide to dealing with depression and substance abuse.",
    price: 20,
    quantity: 40
  ),
  Product.create!(
    name: "Basic Guitar Chords for the Road",
    author: "Bard",
    description: "Teach yourself surefire hits that will delight all the post-apocalyptic warlords in your life.",
    price: 14,
    quantity: 150,
    featured: true
  ),
  Product.create!(
    name: "Breeding Competitive Show Sandworms for Fun and Profit",
    author: "Paul Atreides",
    description: "Sandworms are not just a boy's best friend! Their care and breeding can be a career!",
    price: 33,
    quantity: 50
  ),
  Product.create!(
    name: "View from a Window Ledge: The Beginning of my Journey into Flight",
    author: "Flower Pot",
    description: "A short treatise on the effects of improbability drives on innocent bystanders",
    price: 12,
    quantity: 5
  ),
  Product.create!(
    name: "Truth or Steak: Is a Virtual World Right for You",
    author: "Cypher",
    description: "A self help guide that will assist the average Joe in choosing between reality and the comforts of the matrix.",
    price: 5,
    quantity: 40,
    discount: 15,
    discount_end: Date.today + 10.days
  )
]
