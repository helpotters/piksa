class ToppingsController < ApplicationController
  def index
    @toppings = Topping.all
  end

  def new
    @topping = Topping.new
  end
  def create
    @topping = Topping.new(topping_params)
    if @topping.save
      redirect_to toppings_path, notice: 'Topping was successfully created.'
    else
      render :new
    end
  end

  private

  def topping_params
    params.require(:topping).permit(:name)
  end

end
