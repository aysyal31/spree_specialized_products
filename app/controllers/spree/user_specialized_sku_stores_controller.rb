module Spree
  class UserSpecializedSkuStoresController < Spree::BaseController
    before_action :redirect_unauthorized_access, unless: :spree_current_user
    before_action :load_form_data, only: [:new, :create, :show]
    #before_action :load_return_authorization, only: :show
    #before_action :load_form_data, only: :show
    #before_action :check_for_returnable_products_in_order, only: :new

    def index
      #@return_authorizations = spree_current_user.return_authorizations.includes(:order).order(created_at: :desc)
      # change to active      
      @user_specialized_sku_stores = spree_current_user.specialized_sku_stores

    end

    def new
      # search the param ine xcel and write if else 
      #if params()
      #@user_specialized_store = spree_current_user.user_specialized_stores.build
      @user_specialized_store = spree_current_user.user_specialized_sku_stores.new

    end

    def create
      #@user_specialized_store = @order.return_authorizations.build(create_return_authorization_params)
       @user_specialized_store = spree_current_user.user_specialized_sku_stores.new(user_specialized_sku_store_params)
       # check if present in excel 


       @find_auth_user = Spree::SkuStoresAuth.where("email =?",spree_current_user.email).first
                 
          if @find_auth_user.seller_id == params["affiliated_seller_number"] && @find_auth_user.pincode == params["pincode"] && @user_specialized_store.save
            respond_with(@user_specialized_store) do |format|
              format.html do
                flash[:success] = Spree.t(:successfully_created, resource: 'Added new specialized Sku')
                redirect_to account_path
                return
              end
            end
          else

        #end

       



      # if @user_specialized_store.save
      #   respond_with(@user_specialized_store) do |format|
      #     format.html do
      #       flash[:success] = Spree.t(:successfully_created, resource: 'Added new specialized Sku')
      #       redirect_to user_path
      #     end
      #   end
      # else

        respond_with(@user_specialized_store) do |format|
          flash.now[:error] = @user_specialized_store.errors.full_messages.to_sentence
          format.html do
            load_form_data
            redirect_to :back
          end
        end
      end
    

    end

    def show
    end

    private

    def create_return_authorization_params
      return_authorization_params.merge(user_initiated: true)
    end

    def load_form_data
      load_specialized_sku_stores
      #load_return_authorization_reasons
    end

    # To satisfy how nested attributes works we want to create placeholder ReturnItems for
    # any InventoryUnits that have not already been added to the ReturnAuthorization.
    def load_specialized_sku_stores
      @specialized_sku_stores = Spree::SpecializedSkuStore.all
      # all_inventory_units = @order.inventory_units
      # associated_inventory_units = @return_authorization.return_items.map(&:inventory_unit)
      # unassociated_inventory_units = all_inventory_units - associated_inventory_units

      # new_return_items = unassociated_inventory_units.map do |new_unit|
      #   @return_authorization.return_items.build(inventory_unit: new_unit).tap(&:set_default_pre_tax_amount)
      # end

      # @form_return_items = (@return_authorization.return_items + new_return_items).sort_by(&:inventory_unit_id).uniq
    end

    def load_return_authorization_reasons
      @return_authorization_reasons = Spree::ReturnAuthorizationReason.active
    end

    def load_order
      @order = spree_current_user.orders.shipped.find_by(number: params[:order_id])

      unless @order
        flash[:error] = Spree.t('order_not_found')
        redirect_to account_path
      end
    end

    def load_return_authorization
      @return_authorization = @order.return_authorizations.find_by(number: params[:id])

      unless @return_authorization
        flash[:error] = Spree.t('return_authorizations_controller.return_authorization_not_found')
        redirect_to account_path
      end
    end

    def check_for_returnable_products_in_order
      unless @order.has_returnable_products? && @order.has_returnable_line_items?
        flash[:error] = Spree.t('return_authorizations_controller.return_authorization_not_authorized')
        redirect_to account_path
      end
    end

    def user_specialized_sku_store_params
      params.require(:user_specialized_sku_store).permit(:specialized_sku_store_id)
    end

  end
end