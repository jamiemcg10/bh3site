ActiveAdmin.register SpecialEvent do
  actions :all, except: [:new, :edit, :destroy]
end
