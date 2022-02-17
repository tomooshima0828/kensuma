ActiveAdmin.register News do
  
  permit_params :title, :context, :status, :delivered_at

  index do
    selectable_column
    id_column
    column :title
    column :context
    column :status
    column :delivered_at
    actions
  end

  filter :title
  filter :context
  filter :status
  filter :delivered_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :context
      f.input :status
      f.input :delivered_at
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :context, :status, :delivered_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :context, :status, :delivered_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
