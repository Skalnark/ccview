class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :imagePath
      t.text :description

      t.timestamps
    end
  end
end
