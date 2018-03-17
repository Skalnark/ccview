class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :institution
      t.string :nickname

      t.timestamps
    end
  end
end
