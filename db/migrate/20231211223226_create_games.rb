class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :platform
      t.boolean :completed
      t.text :review

      t.timestamps
    end
  end
end
