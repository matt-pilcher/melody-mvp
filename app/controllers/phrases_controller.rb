class PhrasesController < ApplicationController
  def create 
    @song = Song.find(params[:song_id])
    @phrase = @song.phrases.create(phrase_params)

    redirect_to song_path(@song)
  end

  private
    def phrase_params
      params.require(:phrase).permit(:sentence, :translation)
    end
end
