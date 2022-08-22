class AddPrefNameToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :pref_name, :string
  end
end
