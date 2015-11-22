require 'rails_helper'

RSpec.describe "user_products/index", type: :view do
  before(:each) do
    assign(:user_products, [
      UserProduct.create!(
        :user_id => 1,
        :product_category_id => 2,
        :product_id => 3,
        :order_date => ""
      ),
      UserProduct.create!(
        :user_id => 1,
        :product_category_id => 2,
        :product_id => 3,
        :order_date => ""
      )
    ])
  end

  it "renders a list of user_products" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
