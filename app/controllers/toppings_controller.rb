class ToppingsController < ApplicationController
  before_action :authorize_store_owner, only: [:new, :create, :edit, :destroy]

  def index
    @toppings = Topping.all
  end

  def edit
    @topping = Topping.find(params[:id])
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

  def destroy
    @topping = Topping.find(params[:id])
    if @topping.destroy
      redirect_to toppings_path, notice: 'Less toppings, more money'
    else
      redirect_to toppings_path, alert: 'You cannot outpizza the hut'
    end
  end


  private

  def topping_params
    params.require(:topping).permit(:name)
  end
  def authorize_store_owner
    unless current_user&.role == 'store_owner'
      redirect_to root_path, alert: 'You are not papa john'
    end
  end
end
