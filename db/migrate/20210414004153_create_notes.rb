class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes, id: :uuid do |t|
      t.string :title
      t.text :body
      t.uuid :user_id
      t.boolean :pinned

      t.timestamps
    end
  end
end
