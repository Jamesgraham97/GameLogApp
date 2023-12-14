class CreateRatingReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :rating_reviews do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
