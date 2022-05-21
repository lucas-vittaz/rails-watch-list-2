class ListsController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(list_params)
    if @movie.save
      redirect_to list_path(@movie)
    else
      render :new
    end
  end

  def destroy
    @movie.destroy
    redirect_to movie_path
  end

  private


  def list_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
