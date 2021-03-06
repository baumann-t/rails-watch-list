class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def search
    search = params[:search]
    @movie_result = Movie.search_movie(search)
    render :new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to(movies_path)
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to(movies_path)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating, :photo)
  end

end
