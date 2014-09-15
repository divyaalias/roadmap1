class CreateEmploys < ActiveRecord::Migration
  def change
    create_table :employs do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :email
      t.string :dob
      t.string :designation

      t.timestamps
    end
  end
end
