class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # add routes
  get '/' do
    "Hello World"
  end

  get '/bakeries' do
    response = Bakery.all
    response.to_json
  end

  get '/bakeries/:id' do
    response = Bakery.find(params[:id])
    response.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    response = BakedGood.order('price desc')
    response.to_json
  end

  get '/baked_goods/most_expensive' do
    response = BakedGood.order('price desc').first
    response.to_json
  end

  

end
