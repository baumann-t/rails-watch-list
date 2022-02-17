Movie.destroy_all

url = "https://api.themoviedb.org/3/movie/top_rated?api_key=47fb1ec1c70965ea1b18e4506d3f545d"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

puts "starting seeding"


user["results"].each do |movie|
  name = Movie.create(
        title: movie['title'],
        overview: movie['overview'],
        poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
        rating: movie['vote_average']
      )
    puts name.title
end

puts "finished seeding"
