class BookmarksController < ApplicationController
before_action :find_bookmark, except: %i[index new create]
before_action :find_list


  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      #this will load a brand new page
      redirect_to list_path(@list)
    else
      #this will reload with erros on the form
      render :new #"lists/show"
    end
  end

  def edit
  end

  def update
    @bookmark = update(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render "/bookmarks/#{@bookmark.id}"
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@list)

  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end

end
