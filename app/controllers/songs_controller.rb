class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        set_song
    end

    def edit
        set_song
    end

    def update
        set_song
        if @song.update(songs_params)
            redirect_to @song
        else
            render :edit
        end
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(songs_params)
        if @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def destroy
        set_song.destroy
        redirect_to @song
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end

    def songs_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
