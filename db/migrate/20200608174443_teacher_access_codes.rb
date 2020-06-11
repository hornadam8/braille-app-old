class TeacherAccessCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :teacheraccesscodes do |t|
      t.integer :school_id
      t.integer :teacher_id
      t.string :code
    end
  end
end
