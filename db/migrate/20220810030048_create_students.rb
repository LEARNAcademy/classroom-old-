class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.float :absences
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :cohort, null: false, foreign_key: true

      t.timestamps
    end
  end
end
