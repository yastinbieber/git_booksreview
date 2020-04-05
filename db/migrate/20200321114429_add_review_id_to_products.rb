class AddReviewIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :review_id, :integer
  end
end
