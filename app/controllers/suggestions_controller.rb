class SuggestionsController < ApplicationController

  def index
    products = Product.filter(params)
    render json: {suggestions: edit_format(products)}
  end

  private

  def edit_format(products)
    # Remove created_at and updated_at from result
    products = products.as_json(except: [:created_at, :updated_at])
    # Edit and translate category
    products.each do |p|
      p['category'] = {
      'id' => p['category'], 
      'trans' => {
        'en' => (I18n.t "cat.#{p['category']}"), 
        'es' => (I18n.t "cat.#{p['category']}", locale: :es)
      }}
    end
  end
end
