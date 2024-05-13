class FruitsController < ApplicationController
  before_action :client, only: [:index, :show]

  def index
    @fruits = client.getFruits
  end

  def show
    name = params[:id]
    @fruit = client.getFruit(name)
    @fruit_img = client.getFruitImg(name)
    puts "@fruit: #{@fruit}"  # Debug output
    
  end

  private

    def client
     Fruityvice::V1::Client.new
    end

end
