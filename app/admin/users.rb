ActiveAdmin.register User do
  permit_params :user_name,:email, :password

  index do
    selectable_column
    id_column
    column :user_name
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :user_name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user_name
      f.input :email
      f.input :password
    end
    f.actions
  end
end
