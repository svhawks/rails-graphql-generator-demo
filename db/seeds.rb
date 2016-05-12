# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


director = Person.create(name: 'Anthony Russo', ranking: 1)
director.movies.create(name: 'Captain America: Civil War', year: 2016, ranking: 2)
director.movies.create(name: 'Avengers: Infinity War - Part I', year: 2018, ranking: 20)
director.movies.create(name: 'Avengers: Infinity War - Part II ', year: 2019, ranking: 30)


director = Person.create(name: 'Bryan Singer', ranking: 2)
director.movies.create(name: 'X-Men: Apocalypse', year: 2016, ranking: 4)
director.movies.create(name: 'X-Men: Days of Future Past', year: 2014, ranking: 40)

director = Person.create(name: 'Jon Favreau', ranking: 3)
director.movies.create(name: 'The Jungle Book', year: 2016, ranking: 5)

director = Person.create(name: 'Harald Braun', ranking: 4)
director.movies.create(name: 'Power Rangers', year: 2015, ranking: 6)