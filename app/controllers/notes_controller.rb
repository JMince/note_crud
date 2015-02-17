class NotesController < ApplicationController

    def index
      @notes = Note.all
    end


    def new
      @notes = Note.new
    end


    def create
      @note = Note.new(note_params)
       if @note.save
         redirect_to notes_path
       else
         render :new
      end
    end


    def show
      @note = Note.find(params[:id])
    end


    def edit
      @notes = Note.find(params[:id])
    end


    def update
      @notes = Note.find(params[:id])
      if
        @notes.update(note_params)
        redirect_to notes_path(@quote)
      else
        render :edit
      end
    end

    def destroy
      Note.destroy(params[:id])
      redirect_to notes_path
    end


    private

    def note_params
      params.require(:note).permit(:content, :author)

    end


end
