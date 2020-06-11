class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :role
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
