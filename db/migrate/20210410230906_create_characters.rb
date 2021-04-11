class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :img
      t.string :status
      t.string :nickname
      t.string :portrayed

      t.timestamps
    end
  end
end
