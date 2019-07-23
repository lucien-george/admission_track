require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def home
    if params[:movie].present?
      @movies = Movie.search(params[:movie])
    else
      @movies = Movie.search
    end
  end

  private

  def get_movies(search = "batman")
  end

end
