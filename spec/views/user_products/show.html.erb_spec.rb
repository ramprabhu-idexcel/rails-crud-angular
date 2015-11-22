require 'rails_helper'

RSpec.describe "user_products/show", type: :view do
  before(:each) do
    @user_product = assign(:user_product, UserProduct.create!(
      :user_id => 1,
      :product_category_id => 2,
      :product_id => 3,
      :order_date => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
