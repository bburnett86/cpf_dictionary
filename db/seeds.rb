# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Word.create!(abbreviation: "ASB", full_word: "Asbestos",definition: "a heat-resistant fibrous silicate mineral that can be woven into fabrics, and is used in fire-resistant and insulating materials such as brake linings")

User.create!(username: "bret", password: "password", admin: true)