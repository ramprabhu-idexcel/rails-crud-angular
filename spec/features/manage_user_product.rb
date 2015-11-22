require 'rails_helper'

feature 'Manage User Product' do
  before(:each) { login_admin('doej@test.com') }

  let!(:product_category) { FactoryGirl.create(:product_category) }
  let!(:product_category1) { FactoryGirl.create(:product_category,name: "Electronics") }
  let!(:product1) { FactoryGirl.create(:product,product_category_id: product_category.id,name: "Book1") }
  let!(:product2) { FactoryGirl.create(:product,product_category_id: product_category.id,name: "Book2") }
  let!(:product3) { FactoryGirl.create(:product,product_category_id: product_category.id,name: "Book3") }
  let!(:product4) { FactoryGirl.create(:product,product_category_id: product_category1.id,name: "Cooker") }
  let!(:product5) { FactoryGirl.create(:product,product_category_id: product_category1.id,name: "Fan") }

  scenario '#manages user products',:js => true do

    visit admin_user_products_path
    click_on "New User Product"
    select "doej@test.com", from: "User"
    select product_category.name, from: "Product Category"
    sleep 2
    select product2.name, from: "Product"
    click_on "Create User product"
    expect(page).to have_content('User product was successfully created.')

    visit admin_user_products_path
    click_on "View"
    expect(page).to have_content('doej@test.com').and have_content('Books').and have_content('Book2')

    visit admin_user_products_path
    click_on "Edit"
    select "doej@test.com", from: "User"
    select product_category1.name, from: "Product Category"
    sleep 2
    select product4.name, from: "Product"
    click_on "Update User product"
    expect(page).to have_content('User product was successfully updated.')

    visit admin_user_products_path
    click_on "View"
    expect(page).to have_content('doej@test.com').and have_content('Electronics').and have_content('Cooker')

    visit admin_user_products_path
    click_on "Delete"
    #page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('User product was successfully destroyed.')

  end
end



