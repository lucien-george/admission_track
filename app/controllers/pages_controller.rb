require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def home
    if params[:movie].present?
      @movies = JSON.parse(open("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&query=#{params[:movie]}").read)['results']
    else
      @movies = JSON.parse(open("https://api.themoviedb.org/3/movie/upcoming?api_key=#{ENV['TMDB_API_KEY']}").read)['results']
    end
    @top_rated = JSON.parse(open("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}").read)['results'].first(4)
  end
end
