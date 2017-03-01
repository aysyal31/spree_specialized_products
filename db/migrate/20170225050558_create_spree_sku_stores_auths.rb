class CreateSpreeSkuStoresAuths < ActiveRecord::Migration
  def change
    create_table :spree_sku_stores_auths do |t|
      t.string :seller_id
      t.string :pincode
      t.string :email
      t.string :marketplace

      t.timestamps null: false
    end
  end
end
