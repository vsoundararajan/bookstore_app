# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create(first_name: "Agatha", last_name: "Christie")
Author.create(first_name: "James", last_name: "Bond")
Author.create(first_name: "Sydney", last_name: "Sheldon")
Author.create(first_name: "Manikka", last_name: "Vaasagar")
Author.create(first_name: "Obie", last_name: "Fernandez")
Author.create(first_name: "Rida", last_name: "Al Barazi")

Publisher.create!([
   {name: "Wiley"},
   {name: "Addison Wesley"},
   {name: "Peachpit Press"},
   {name: "Manning Publications"},
   {name: "McGraw-Hill"},
   {name: "No Starch Press"}
])

Book.create(title: "Gnuplot in Action", isbn: '978-789', 
            page_count: 675, price: 88.99, description: "Description A",
            published_at: '2010-01-01', publisher_id: 4, 
            book_cover: File.open(File.join(Rails.root, 'app/assets/images/gnuplot.jpg')))

