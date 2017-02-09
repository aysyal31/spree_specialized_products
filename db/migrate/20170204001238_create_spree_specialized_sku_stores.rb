class CreateSpreeSpecializedSkuStores < ActiveRecord::Migration
  def change
    create_table :spree_specialized_sku_stores do |t|
      t.string :specialized_store_name
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
