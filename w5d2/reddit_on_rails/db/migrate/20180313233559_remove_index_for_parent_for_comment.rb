class RemoveIndexForParentForComment < ActiveRecord::Migration[5.1]
  def change
    remove_index :comments, :parent_comment_id
  end
end
