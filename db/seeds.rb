# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{name: 'programming'}, {name: 'wordpress'}, {name: 'ios'}])

skills = Skill.create([{title: 'programming with myspace', url: 'http://www.myspace.com', description: 'Learn to code with myspace', price: '$25', image: 'hacking.jpeg'}, {title: 'wordpress tutorial', url: 'http://www.wordpress.com', description: 'Learn some wordpress', price: '$20', image: 'code_school.jpeg'}, {title: 'IOS stuff', url: 'http://www.yahoo.com', description: 'learn ios', price: '$10', image: 'hacking.jpeg'}, {title: 'learn everything', url: 'http://www.google.com', description: 'wow cool stuff learn it all', price: 'Free', image: 'hacking.jpeg'}])
