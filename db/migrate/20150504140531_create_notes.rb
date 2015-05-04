class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content, null: false
      t.timestamps null: false
    end

    add_index :notes, :content, unique: true
  end
end
