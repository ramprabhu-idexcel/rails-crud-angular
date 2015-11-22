require 'rails_helper'

RSpec.describe VisitorsController, :type => :controller do

  before(:each) do
    login_with create( :user )
  end

  describe "anonymous user" do
    it "should be redirected to signin" do
      login_with nil
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "should let a user see all the visitors" do
      get :index
      expect( response ).to render_template( :index )
    end
  end

  describe '#index' do

    it "should be able to display all visitors" do
      visitor = FactoryGirl.create(:visitor)
      get :index, format: :json
      result = JSON.parse(response.body)
      assigns(:visitors).should eq([visitor])
      expect(result.count).to eq(1)
    end

  end

  describe 'Post Create' do

    context "with valid attributes" do
      it "should be able to create a new visitor" do
        post :create, visitor: FactoryGirl.attributes_for(:visitor), format: :json
        expect(response).to be_success
        result = JSON.parse(response.body)
        expect(result["first_name"]).to eql("ram")
        expect(result["last_name"]).to eql("prabhu")
        expect(result["sex"]).to eql("male")
        expect(result["age"]).to eql(28)
        expect(result["phone_no"]).to eql("9600804251")
        expect(result["location"]).to eql("Chennai")
        expect(result["reason"]).to eql("Interview")
        expect(result["contact_person"]).to eql("HR")
        expect(result["id_proof"]).to eql("Pan Card")
        expect(result["id_number"]).to eql("BADPR2605A")
      end
    end

    context "with invalid attributes" do
      it "does not save the new visitor" do
        expect{ post :create, visitor: FactoryGirl.attributes_for(:invalid_visitor), format: :json }.to_not change(Visitor,:count)
      end
    end

  end

  describe  'Update Visitor' do

    context "with valid attributes" do
      it "should be able to update a user" do
        @visitor = FactoryGirl.create(:visitor)
        put :update, id: @visitor,visitor: FactoryGirl.attributes_for(:visitor, first_name: "Larry", last_name: "Smith")
        @visitor.reload
        expect(@visitor.first_name).to eq('Larry')
        expect(@visitor.last_name).to eq('Smith')
        expect(@visitor.first_name).not_to eq('ram')
        expect(@visitor.last_name).not_to eq('prabhu')
      end
    end

  end

  describe 'DELETE destroy' do
    before :each do
      @visitor = FactoryGirl.create(:visitor)
    end

    it "deletes the visitor" do
      expect{ delete :destroy, id: @visitor }.to change(Visitor,:count).to eq(0)
    end
  end
end