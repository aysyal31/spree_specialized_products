class AddSpecializedSkuStoreToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :specialized_sku_store_id, :integer
    add_index :spree_products, :specialized_sku_store_id
  end
end
