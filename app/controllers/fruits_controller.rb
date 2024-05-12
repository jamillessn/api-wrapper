class FruitsController < ApplicationController

  def index
    @client = Fruityvice::V1::Client.new
    @fruits = @client.getFruits
  end

  def show
    @fruit = client.fruit(params[:id])
  end

end
