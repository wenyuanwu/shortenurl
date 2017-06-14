# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Visit.destroy_all
ShortenedUrl.destroy_all

User.create(email: "a")
User.create(email: "b")


s1= ShortenedUrl.create_for_user_and_long_url!(User.first, "https://github.com/appacademy/curriculum/blob/master/sql/readings/has-many-through.md")
s2= ShortenedUrl.create_for_user_and_long_url!(User.first, "https://github.com/appacademy/curriculum/tree/master/sql/projects/url_shortener")
s3 = ShortenedUrl.create_for_user_and_long_url!(User.last, "https://github.com/appacademy/curriculum/blob/master/sql/README.md#w3d3")


Visit.record_visit!(User.first,s1)
Visit.record_visit!(User.first,s1)
Visit.record_visit!(User.first,s1)
Visit.record_visit!(User.last,s1)
Visit.record_visit!(User.last,s3)
