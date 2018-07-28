# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# cat1 = Cat.create!(birth_date: '2013/08/23', color: 'brown', name: 'Kitty', sex: 'M', description: 'Has a long tail')
# cat2 = Cat.create!(birth_date: '2018/02/01', color: 'black', name: 'Jim', sex: 'F', description: 'Has one good eye')
# cat3 = Cat.create!(birth_date: '2012/11/18', color: 'orange', name: 'Jane', sex: 'F', description: 'Has no tail')

rental1 = CatRentalRequest.create!(cat_id: 1, start_date: "2014/09/23", end_date: "2014/10/23", status: "APPROVED")
rental2 = CatRentalRequest.create!(cat_id: 2, start_date: "2016/09/23", end_date: "2017/10/23", status: "APPROVED")
rental3 = CatRentalRequest.create!(cat_id: 3, start_date: "2017/09/23", end_date: "2018/10/23", status: "APPROVED")
rental4 = CatRentalRequest.create!(cat_id: 1, start_date: "2014/10/24", end_date: "2014/11/23", status: "APPROVED")
