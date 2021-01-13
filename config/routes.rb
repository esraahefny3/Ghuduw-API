Rails.application.routes.draw do
  get 'higri_dates/getData'
  get 'higri_dates/loadData'
  get 'higri_dates/displayDBTable'
  get 'higri_dates/updateCountriesDate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
