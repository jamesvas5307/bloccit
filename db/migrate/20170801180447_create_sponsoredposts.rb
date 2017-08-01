class CreateSponsoredposts < ActiveRecord::Migration
  def change
    create_table :sponsoredposts do |t|
      t.string :name
      t.integer :price
      t.text :body

      t.timestamps null: false
    end
  end
end
