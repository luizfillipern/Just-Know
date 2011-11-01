class AddAverageScoreToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :average_score, :float, :default => 0
  end
end
