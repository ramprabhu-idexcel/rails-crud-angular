ActiveAdmin.register UserProduct do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :user_id, :product_category_id, :product_id, :order_date
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


  collection_action :dynamic_select, :method => :post do
    models = ProductCategory.find(params[:user_product_product_category_id]).products
    render :text => view_context.options_from_collection_for_select(models, :id, :name)
  end

  form do |f|
    f.inputs do
      f.input :user_id,  as: :select, collection: User.all.map { |user| [user.email,user.id] }
      f.input :product_category_id, as: :select, collection: ProductCategory.all, label: 'Product Category', input_html: {
                                onchange: remote_get('user_product_product_category_id', 'user_product_product_id')}
      f.input :product_id, as: :select, collection: [], label: 'Product'

    end

    f.actions
  end

  index do
    column :user
    column :product_category
    column :product
    actions
  end


end
