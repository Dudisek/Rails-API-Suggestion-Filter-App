require 'rails_helper'

describe 'GET Suggestions', type: :request do 

  Product.create!(name: "Dental Paper", price: 12.23, category: 2, image: "http://dasd.cz")
  Product.create!(name: "Tootbrash Pap", price: 5.23, category: 1, image: "http://dsadasd.cz")

  it 'finds 2 products by name' do 
    get '/suggestions?q=Pap'
    expect(response.body).to include "Dental Paper"
    expect(response.body).to include "Tootbrash Pap"
  end

  it 'finds 1 product with optional params' do 
    get '/suggestions?q=Pap&minprice=10&maxprice=15&cat=2'
    expect(response.body).not_to include "Tootbrash Pap"
    expect(response.body).to include "Dental Paper"
  end

  it 'does not find any object' do 
    get '/suggestions?q="dsadwqdqdadsa"'
    expect(response.body).to include "[]"
  end

end
