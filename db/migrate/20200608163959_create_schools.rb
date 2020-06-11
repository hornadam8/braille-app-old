class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :abbreviation
      t.string :admin_code
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
