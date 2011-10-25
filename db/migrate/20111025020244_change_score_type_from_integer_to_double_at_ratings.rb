class ChangeScoreTypeFromIntegerToDoubleAtRatings < ActiveRecord::Migration
  def up
    change_column :ratings, :score, :double
  end

  def down
    change_column :ratings, :score, :integer
  end
end
