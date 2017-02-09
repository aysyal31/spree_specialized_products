class Spree::Admin::SpecializedSkuStoresController < Spree::Admin::ResourceController
 def edit
    # @object.address = Spree::Address.default unless @object.address.present?
    # respond_with(@object) do |format|
    #   format.html { render :layout => !request.xhr? }
    #   format.js   { render :layout => false }
    # end
  end

  def new
    @object = Spree::SpecializedSkuStore.new()
  end

  private

    def collection
      params[:q] ||= {}
      params[:q][:meta_sort] ||= "name.asc"
      @search = Spree::SpecializedSkuStore.search(params[:q])
      @collection = @search.result.page(params[:page]).per(Spree::Config[:orders_per_page])
    end

    def find_resource
      Spree::SpecializedSkuStore.find(params[:id])
    end

    def location_after_save
      spree.edit_admin_specialized_sku_store_path(@object)
    end
end
