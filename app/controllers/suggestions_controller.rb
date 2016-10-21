class SuggestionsController < ApplicationController

  def index
    products = Product.filter(params)
    products = products.as_json(except: [:created_at, :updated_at])
    render json: {suggestions: products}
  end

end
