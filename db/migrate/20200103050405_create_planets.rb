class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :life
      t.integer :moons
      t.string :image
      t.references :star, null: false, foreign_key: true

      t.timestamps
    end
  end
end
