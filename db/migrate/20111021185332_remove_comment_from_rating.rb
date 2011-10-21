class RemoveCommentFromRating < ActiveRecord::Migration
  def up
    remove_column :ratings, :comment
  end

  def down
    add_column :ratings, :comment, :string
  end
end
