class UserProductsController < InheritedResources::Base

  private

    def user_product_params
      params.require(:user_product).permit(:user_id, :product_category_id, :product_id, :order_date)
    end
end

