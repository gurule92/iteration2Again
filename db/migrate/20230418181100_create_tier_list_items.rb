class CreateTierListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :tier_list_items do |t|
      t.references :tier_list, null: false, foreign_key: true
      t.string :name
      t.integer :tier
      t.text :justification
      t.text :description

      t.timestamps
    end
  end
end
