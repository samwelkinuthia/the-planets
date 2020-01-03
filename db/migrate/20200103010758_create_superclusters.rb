class CreateSuperclusters < ActiveRecord::Migration[6.0]
  def change
    create_table :superclusters do |t|
      t.string :name

      t.timestamps
    end
  end
end
