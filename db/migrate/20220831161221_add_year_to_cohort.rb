class AddYearToCohort < ActiveRecord::Migration[7.0]
  def change
    add_column :cohorts, :year, :integer
  end
end
