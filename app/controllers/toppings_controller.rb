class ToppingsController < ApplicationController
  before_action :authorize_store_owner, only: [:new, :create]

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
  def authorize_store_owner
    unless current_user&.role == 'store_owner'
      redirect_to root_path, alert: 'You are not authorized to perform this action'
    end
  end
end
