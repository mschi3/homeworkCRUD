class MoviesController < ApplicationController

  def index
		@movies = Movie.all
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save(movie_params)
			flash[:notice] = "Movie Review was successfully created"
			#redirect_to :action => :index
			redirect_to movie_path(@movie)
		else
			render :action => :new
		end	
	end
  
  def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		if @movie.update(movie_params)
			flash[:notice] = "Movie Review was successfully updated"
			redirect_to movie_path(@movie)
		else
			render 'edit'
		end
	end

	def destroy
	@movie = Movie.find(params[:id])
	@movie.destroy
	flash[:notice] = "Movie Review was successfully deleted"
	redirect_to movies_path
	end

	private

	def movie_params
		params.require(:movie).permit(:title, :description, :rating)
	end

end