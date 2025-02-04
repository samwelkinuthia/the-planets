class CreateStars < ActiveRecord::Migration[6.0]
  def change
    create_table :stars do |t|
      t.string :name
      t.string :image
      t.string :classification
      t.references :galaxy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
