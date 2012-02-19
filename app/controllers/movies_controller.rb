class MoviesController < ApplicationController
  def index
    if params[:start].present? then
      @movies = Movie.search(params[:search], params[:start])
    else
      @movies = Movie.search(params[:search], '0') if params[:search].present?
    end
  end
end
