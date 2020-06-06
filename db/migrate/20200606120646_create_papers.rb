class CreatePapers < ActiveRecord::Migration[6.0]
  def change
    create_table :papers do |t|
      t.text :content
      t.integer :student_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
