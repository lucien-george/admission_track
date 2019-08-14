class Movie
  attr_reader :title, :overview, :id

  def initialize(args = {})
    @id = args[:id]
    @title = args[:title]
    @poster_path = args[:poster_path]
    @overview = args[:overview]
  end

  def poster_url
    return "https://image.tmdb.org/t/p/w500/#{@poster_path}" if @poster_path.present?
  end

  def short_overview
    return overview.truncate(80)
  end

  def self.search(query = "")
    movies = []

    if query.blank?
      api_endpoint = "https://api.themoviedb.org/3/movie/upcoming?api_key=#{ENV['TMDB_API_KEY']}"
    else
      api_endpoint = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&query=#{query}"
    end

    results = JSON.parse(open(api_endpoint).read)['results']
    results.each do |movie_hash|
      raise
      movies << Movie.new(movie_hash.symbolize_keys)
    end

    return movies
  end
end
