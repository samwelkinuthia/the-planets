class CreateGalaxies < ActiveRecord::Migration[6.0]
  def change
    create_table :galaxies do |t|
      t.string :name
      t.string :shape
      t.string :image
      t.integer :size
      t.timestamps
    end
  end
end
