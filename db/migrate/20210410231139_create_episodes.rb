class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :season
      t.integer :episode
      t.string :air_date
      t.string :series

      t.timestamps
    end
  end
end
