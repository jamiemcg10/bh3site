ActiveAdmin.register EventRegistration do
  ACTIVE = 0

  permit_params :contact_email, :hash_name, :nerd_name, :kennel, :payment_email, :food_preference, :gluten_allergy, :dairy_free, :need_crash_space, :have_crash_space, :extra_hab, :extra_hab_size, :registration_date, :paid

  actions :all, except: :destroy

  action_item only: [:show, :edit] do
    link_to "Delete Rego", delete_registration_path(id: params[:id]), method: :post
  end

  SpecialEvent.all.order(date: :desc).each do |event|
    scope event.name.to_sym do |registrations|
      registrations.for_event(event)
    end
  end

  controller do
    def scoped_collection
      super.where(status: ACTIVE)
    end
  end

  filter :special_event
  filter :contact_email
  filter :hash_name
  filter :nerd_name
  filter :kennel
  filter :payment_email
  filter :food_preference
  filter :gluten_allergy
  filter :dairy_free
  filter :need_crash_space
  filter :have_crash_space
  filter :extra_hab
  filter :extra_hab_size
  filter :registration_date
  filter :paid

  index do |registration|
    column :id do |rego|
      link_to rego.id, mismanagement_event_registration_path(rego)
    end
    column :contact_email
    column :hash_name
    column :nerd_name
    column :kennel
    column :payment_email
    column :food_preference
    column :gluten_allergy
    column :dairy_Free
    column :need_crash_space
    column :have_crash_space
    column :extra_hab
    column :extra_hab_size
    column :registration_date
    column :rego_price
    column :paid
    column :status
    actions
  end

  form do |f|
    f.inputs "Change the Fucking Event Regos Here, Hash Mothafuckas!" do
      f.input :special_event
      f.input :contact_email
      f.input :hash_name
      f.input :nerd_name
      f.input :kennel
      f.input :payment_email
      f.input :food_preference
      f.input :extra_hab
      f.input :extra_hab_size
      f.input :registration_date
      f.input :rego_price
    end
    f.actions
  end
end
