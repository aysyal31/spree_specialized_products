Spree::Admin::ProductsController.class_eval do

  before_filter :get_specialized_sku_stores, only: [:edit, :update]
  #before_filter :supplier_collection, only: [:index]
  # create.after :set_supplier

  private

  def get_specialized_sku_stores
    @suppliers = Spree::SpecializedSkuStore.order(:name)
  end

  # def set_specialized_sku_stores
    
  #     @object.master.specialized_sku_store = spree_current_user.supplier
  #     @object.master.save
    
  # end

  # Scopes the collection to the Supplier.
  # def supplier_collection
  #   if try_spree_current_user && !try_spree_current_user.admin? && try_spree_current_user.supplier?
  #     @collection = @collection.joins(:suppliers).where('spree_suppliers.id = ?', spree_current_user.supplier_id)
  #   end
  # end

end