ActiveAdmin.register User do

  index do
    column :email
    column :superadmin
  end

  permit_params :list, :of, :attributes, :on, :model, :email, :password, :password_confirmation, :superadmin

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :superadmin, :label => "Super Administrator"
    end
    f.button "Save"
  end



end