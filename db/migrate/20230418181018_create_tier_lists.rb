class CreateTierLists < ActiveRecord::Migration[6.1]
  def change
    create_table :tier_lists do |t|
      t.string :name
      t.text :description
      t.integer :numTiers

      t.timestamps
    end
  end
end
