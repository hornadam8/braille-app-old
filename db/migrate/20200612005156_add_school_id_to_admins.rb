class AddSchoolIdToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins,:school_id,:integer
  end
end
