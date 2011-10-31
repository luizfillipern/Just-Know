class AddAverageScoreToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :average_score, :double, :default => 0
  end
end
