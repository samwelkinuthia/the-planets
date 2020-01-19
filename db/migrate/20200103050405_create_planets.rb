class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.boolean :life, default: false
      t.integer :moons
      t.string :image
      t.string :category
      t.text :description
      t.belongs_to :star, foreign_key: true
      t.timestamps
    end
  end
end
