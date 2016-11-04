class MoviesController < ApplicationController

	def new
		@movie = Movie.new
	end



	def create
		@movie = Movie.new(movie_params)
		@movie.save
		#redirect_to movie_path(@movie)
		redirect_to :action => :show, :id => @movie
	end

	private

	def movie_params
		params.require(:movie).permit(:title, :description, :rating)
	end

end