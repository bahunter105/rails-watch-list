class MoviesController < ApplicationController
  before_action :find_movie, except: %i[index new create]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @movie = update(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render "/movies/#{@movie.id}"
    end
  end

  def destroy
    @movie.destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
