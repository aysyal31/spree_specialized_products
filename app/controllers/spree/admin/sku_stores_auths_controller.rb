class Spree::Admin::SkuStoresAuthsController < Spree::Admin::ResourceController
 
 def edit
    # @object.address = Spree::Address.default unless @object.address.present?
    # respond_with(@object) do |format|
    #   format.html { render :layout => !request.xhr? }
    #   format.js   { render :layout => false }
    # end
  end

  def new
    @object = Spree::SkuStoresAuth.new()
  end

  private

    def collection
      params[:q] ||= {}
      params[:q][:meta_sort] ||= "name.asc"
      @search = Spree::SkuStoresAuth.search(params[:q])
      @collection = @search.result.page(params[:page]).per(Spree::Config[:orders_per_page])
    end

    def find_resource
      Spree::SkuStoresAuth.find(params[:id])
    end

    def location_after_save
      spree.admin_specialized_sku_stores_path
    end
end
