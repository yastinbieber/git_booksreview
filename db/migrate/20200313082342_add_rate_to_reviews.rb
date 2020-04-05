class AddRateToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :review, :text
  end
end
