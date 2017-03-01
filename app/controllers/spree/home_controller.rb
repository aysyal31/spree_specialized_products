module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @products = @products.filter_products(current_spree_user)
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
