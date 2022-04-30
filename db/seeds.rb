# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'rest-client'

puts 'Deleting database...'
Movie.destroy_all
List.destroy_all

response = RestClient.get 'https://tmdb.lewagon.com/movie/top_rated'
repos = JSON.parse(response)

puts 'Creating movies...'
repos['results'].each do |movie|
  title = movie['original_title']
  overview = movie['overview']
  url = movie['https://image.tmdb.org/t/p/w500/2CAL2433ZeIihfX1Hb2139CX0pW.jpg']
  rating = movie['vote_average']
  if movie['original_language'] == 'en'
    created_movie = Movie.create!(title: title, overview: overview, poster_url: url, rating: rating)
    p "Created movie #{created_movie}"
  end
end

movie_genres = %w[Action Comedy Drama Fantasy Horror Mystery Romance Thriller Western]

puts 'Creating lists...'
movie_genres.each do |genre|
  List.create!(name: genre)
end
