class ProductCategoriesController < InheritedResources::Base

  private

    def product_category_params
      params.require(:product_category).permit(:name)
    end
end

