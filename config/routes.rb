Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "quotations#index"

  get 'spareparts/index' => 'spareparts#index', as: 'spareparts'
  get 'spareparts/:id/add' => 'spareparts#add', as: 'add_sparepart'
  get 'labours/index' => 'labours#index', as: 'labours'
  get 'labours/:id/add' => 'labours#add', as: 'add_labour'
  get 'quotations/index' => 'quotations#index', as: 'quotations'
  post 'quotations/add_discount' => 'quotations#add_discount', as: 'quotation_add_discount'
  get 'quotations/order_details' => 'quotations#order_details', as: 'quotation_details'
  get 'quotations/order_saved' => 'quotations#order_saved', as: 'quotation_saved'
  get 'quotations/order_reset' => 'quotations#order_rest', as: 'quotation_reset'
  get 'quotations/:id/views' => 'quotations#views', as: 'quotation_views'
  get 'quotations/:id/get_html' => 'quotations#get_html', as: 'quotation_get_html'

end
