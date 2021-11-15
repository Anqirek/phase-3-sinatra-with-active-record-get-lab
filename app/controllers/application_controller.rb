class ApplicationController < Sinatra::Base
set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
  bakeries = Bakery.all
  bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_good' do
   bakery = BakedGood.all
   bakery.to_json
  end

  get '/baked_good/by_price' do
    baked_goods = BakedGood.all.by_price
    baked_goods.to_json
  end

  get '/baked_good/most_expensive' do
    baked_good = BakedGood.all.by_price.order(:price).first
    baked_good.to_json
  end
end
