require 'spec_helper'

describe Visitor do

  it "has a valid factory" do
    FactoryGirl.create(:visitor).should be_valid
  end

  it "is invalid without a firstname" do
    FactoryGirl.build(:visitor, first_name: nil).should_not be_valid
  end

  it "is invalid without a lastname" do
    FactoryGirl.build(:visitor, last_name: nil).should_not be_valid
  end

  it "is invalid without a sex" do
    FactoryGirl.build(:visitor, sex: nil).should_not be_valid
  end

  it "is invalid without a age" do
    FactoryGirl.build(:visitor, age: nil).should_not be_valid
  end

  it "is invalid without a phone_no" do
    FactoryGirl.build(:visitor, phone_no: nil).should_not be_valid
  end

  it "is invalid without a location" do
    FactoryGirl.build(:visitor, location: nil).should_not be_valid
  end

  it "is invalid without a reason" do
    FactoryGirl.build(:visitor, reason: nil).should_not be_valid
  end

  it "is invalid without a contact_person" do
    FactoryGirl.build(:visitor, contact_person: nil).should_not be_valid
  end

  it "is invalid without a id_proof" do
    FactoryGirl.build(:visitor, id_proof: nil).should_not be_valid
  end

  it "is invalid without a id_number" do
    FactoryGirl.build(:visitor, id_number: nil).should_not be_valid
  end

  it "returns a contact's full name as a string" do
    FactoryGirl.create(:visitor, first_name: "John", last_name: "Doe").name.should == "John Doe"
  end

end