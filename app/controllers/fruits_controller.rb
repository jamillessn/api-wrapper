class FruitsController < ApplicationController
  before_action :client, only: [:index, :show, :all_data]

  def index
    @fruits = client.getFruits
  end

  def show
    name = params[:id]
    @fruit = client.getFruit(name)
  end

  def all_data
    res = client.getFruits
    render json: res
  end

  private

  def client
    Fruityvice::V1::Client.new
  end
end
