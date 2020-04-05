class AddCommentIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :comment_id, :integer
  end
end
