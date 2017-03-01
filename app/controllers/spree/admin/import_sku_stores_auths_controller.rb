class Spree::Admin::ImportSkuStoresAuthsController < Spree::Admin::ResourceController


  def new
    @import_store_auth = Spree::ImportSkuStoresAuth.new
  end


  def create
    @import_store_auth = Spree::ImportSkuStoresAuth.new(params[:import_sku_stores_auth])

    if @import_store_auth.save
       redirect_to admin_sku_stores_auths_path, notice: 'File successfully uploaded'
    else
      render :new
    end
  end





end

# class Admin::Drivers::ImportDriversController < Admin::BaseController

#   def new
#     @import_driver = ImportDriver.new
#   end

#   def create
#     @import_driver = ImportDriver.new(params[:import_driver])
#     @trucker = Trucker.find_by_id(params[:trucker_id])
#     @user = @trucker.user

#     if @import_driver.save(@user)
#        redirect_to admin_drivers_drivers_path(:trucker_id => @user.mrole_id), notice: 'File successfully uploaded'
#     else
#       render :new
#     end
#   end

# end
