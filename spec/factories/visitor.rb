FactoryGirl.define do
  factory :visitor, :class => 'Visitor' do
    first_name 'ram'
    last_name 'prabhu'
    sex 'male'
    age 28
    phone_no '9600804251'
    location 'Chennai'
    reason 'Interview'
    contact_person 'HR'
    id_proof 'Pan Card'
    id_number 'BADPR2605A'
  end

  factory :invalid_visitor, parent: :visitor do |f|
    f.first_name nil
    f.last_name nil
    f.sex nil
    f.age nil
    f.phone_no nil
    f.location nil
    f.reason nil
    f.contact_person nil
    f.id_proof nil
    f.id_number nil
  end
end





