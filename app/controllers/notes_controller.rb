class NotesController < ApplicationController

  def index
  end

  def show
  end

  def new
    
  end

  def create

  end

  def edit
    
  end

  def update
    binding.pry
  end

  def destroy
    
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :pinned, :user_id)
  end

end