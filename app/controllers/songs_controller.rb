class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create 
    @song = Song.new(song_params)

    if @song.save 
      redirect_to @song
    else 
      render :new, status: unprocessable_entity
    end
  end

  private 
    def song_params
      params.require(:song).permit(:title, :lyrics)
    end
end
