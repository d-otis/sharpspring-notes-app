module NotesHelper
  def edit(note)
    link_to("[edit]", edit_note_path(note))
  end

  def delete(note)
    "[delete]"
  end

  def pin(note)
    btn_text = note.pinned? ? "[unpin]" : "[pin]"

    button_to btn_text, @user, method: :patch
  end

  def date
    @note.created_at.strftime('%A, %b %e, %Y @ %I:%M%p')
  end

  def note_meta
    "Create by #{@note.user.full_name} #{date}"
  end
end
