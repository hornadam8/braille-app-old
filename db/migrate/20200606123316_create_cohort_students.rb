class CreateCohortStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :cohort_students do |t|
      t.integer :cohort_id
      t.integer :student_id
    end
  end
end
