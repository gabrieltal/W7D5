# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Cat.create!(birth_date: "2001/01/12", color: "brown", name: "Doc McStuffins", sex: "M", description: "Cat has been known to assault children")
cat2 = Cat.create!(birth_date: "0001/01/12", color: "orange", name: "Cthulhu", sex: "F", description: "Cat has been known to destroy the world and corrupt minds")
cat3 = Cat.create!(birth_date: "2004/01/12", color: "black", name: "Cool Cat", sex: "M", description: "Cat has a known criminal record")

user1 = User.create!(username: "keanureeves", password: "overrated")
user2 = User.create!(username: "sandrabullock", password: "underrated")
user3 = User.create!(username: "juliaroberts", password: "prettybigmouth")
