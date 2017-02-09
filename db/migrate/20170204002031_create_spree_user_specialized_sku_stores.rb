class CreateSpreeUserSpecializedSkuStores < ActiveRecord::Migration
  def change
    create_table :spree_user_specialized_sku_stores do |t|
      t.belongs_to :user, index: true
      t.belongs_to :specialized_sku_store, index: true

      t.timestamps null: false
    end
  end
end
