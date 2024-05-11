class FruitsController < ApplicationController

  # GET /fruits or /fruits.json
  def index
    client = Fruityvice::Client.new
    @fruits = client.fruits
  end

  # GET /fruits/1 or /fruits/1.json
  def show
    client = Fruityvice::Client.new
    @fruit = client.fruit(params[:id])
  end

end
