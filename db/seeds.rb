# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all

pasta_al_dente = Product.create(
  name: 'Pasta Al Dente',
  description: "Experience the true essence of Italy with our Pasta Al Dente, a culinary marvel 
  that celebrates the art of perfectly cooked pasta. Each tender, toothsome strand is a testament 
  to our commitment to quality and authenticity. Tossed in a tantalizing medley of handcrafted sauces, 
  from zesty marinara to creamy alfredo, every forkful promises a delightful journey through Italy's diverse 
  flavors. Accompanied by the finest, thoughtfully sourced ingredients, our Pasta Al Dente is a symphony of 
  taste and texture, leaving you yearning for more. Discover the timeless magic of pasta done just right and 
  savor the passion of Italian cuisine on your plate. Mangia bene!",
  price: 22.00,
  vegetarian: false,
  category: 2
)
pasta_al_dente.image.attach(io: File.open(Rails.root.join('app/assets/images/pasta-al-dente.png')), filename: 'pasta-al-dente.png')

puts("PASTA AL DENTE CREATED AND SUCCESSFULLY ADDED TO THE DATABASE, YAY!")


