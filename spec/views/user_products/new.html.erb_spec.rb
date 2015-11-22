require 'rails_helper'

RSpec.describe "user_products/new", type: :view do
  before(:each) do
    assign(:user_product, UserProduct.new(
      :user_id => 1,
      :product_category_id => 1,
      :product_id => 1,
      :order_date => ""
    ))
  end

  it "renders new user_product form" do
    render

    assert_select "form[action=?][method=?]", user_products_path, "post" do

      assert_select "input#user_product_user_id[name=?]", "user_product[user_id]"

      assert_select "input#user_product_product_category_id[name=?]", "user_product[product_category_id]"

      assert_select "input#user_product_product_id[name=?]", "user_product[product_id]"

      assert_select "input#user_product_order_date[name=?]", "user_product[order_date]"
    end
  end
end
