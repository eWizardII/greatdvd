class MoviesController < ApplicationController
  def index

  	if cookies[:uid].nil? then
  		cookies.permanent.signed[:present] = "no"
  		cookies.permanent.signed[:uid] = "1746"
  		redirect_to "http://www.google.com"
  	else
		cookies.permanent.signed[:present] = "yes"
	end

    if params[:start].present? then
      @movies = Movie.search(params[:search], params[:start])
    else
      @movies = Movie.search(params[:search], '0') if params[:search].present?
    end
  end
end
