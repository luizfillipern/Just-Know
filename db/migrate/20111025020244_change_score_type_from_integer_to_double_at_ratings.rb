class ChangeScoreTypeFromIntegerToDoubleAtRatings < ActiveRecord::Migration
  def up
    change_column :ratings, :score, :float
  end

  def down
    change_column :ratings, :score, :integer
  end
end
