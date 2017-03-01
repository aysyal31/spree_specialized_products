Deface::Override.new(virtual_path: 'spree/admin/users/edit',
  name: 'add_loyalty_points_to_admin_user_show_page',
  insert_after: "[data-hook=admin_user_edit_general_settings]",
  text: "
    <div class='panel panel-default' data-hook='specialized-sku-store'>
      <div class=panel-heading><%= Spree.t(:specialized_sku_store) %></div>
      <div class=panel-body>
        <% if @user.specialized_sku_stores.present? %>
          <%= link_to @user.specialized_sku_stores.first, spree.new_specialized_sku_store_path() %>
        <% else %>
          <%= 'No Specialized Sku store yet' %>
        <% end %
      </div>
    </div>
  ")