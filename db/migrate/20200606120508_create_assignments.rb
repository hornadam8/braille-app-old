class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :cohort_id

      t.timestamps
    end
  end
end
