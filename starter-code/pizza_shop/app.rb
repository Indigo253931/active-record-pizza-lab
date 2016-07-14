

class PizzaShop < Sinatra::Base
require 'json'


#PIZZAS

  # index
  get '/pizzas' do
  	content_type :json
    @pizzas = Pizza.all
    @pizzas.to_json
  end


   # create
   post '/pizzas' do
      @pizza = Pizza.create(JSON.parse(request.body.read))
      	@pizza.to_json
  end

   # # show
   get '/pizzas/:id' do
   	content_type :json
      @pizza = Pizza.find(params[:id])
      @pizza.to_json 
    end

  # # update
    put '/pizzas/:id' do
    @pizza = Pizza.find(params[:id])
   @pizza.update_attributes(JSON.parse(request.body.read))
   @pizza.to_json
    end

  # # delete
   delete '/pizzas/:id' do
   	@pizza = Pizza.find(params[:id])
   @pizza.destroy
   end


end
