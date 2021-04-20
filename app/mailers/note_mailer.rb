class NoteMailer < ApplicationMailer

  def note_email
    @user = params[:user]
    @note = @user.notes.last
    mail(to: @user.email, subject: "#{@note.title}")
  end
end
