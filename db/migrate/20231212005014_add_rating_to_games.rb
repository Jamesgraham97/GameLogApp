class AddRatingToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :rating, :decimal
  end
end
