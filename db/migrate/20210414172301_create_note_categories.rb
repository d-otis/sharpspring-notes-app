class CreateNoteCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :note_categories, id: :uuid do |t|
      t.uuid :category_id
      t.uuid :note_id

      t.timestamps
    end
  end
end
