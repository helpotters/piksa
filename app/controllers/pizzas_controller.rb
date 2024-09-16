class PizzasController < ApplicationController
  before_action :authorize_pizza_chef
  before_action :set_pizza, only: [:edit, :update, :destroy]

  def index
    @pizzas = Pizza.all
  end

  def new
    @pizza = Pizza.new
    @toppings = Topping.all
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.save
      redirect_to pizzas_path, notice: 'Pizza was successfully created.'
    else
      @toppings = Topping.all
      render :new
    end
  end

  def edit
    @toppings = Topping.all
  end

  def destroy
    @pizza.destroy
    redirect_to pizzas_path, notice: 'Unworthy pizza, begone.'
  end

  def update
    if @pizza.update(pizza_params)
      redirect_to pizzas_path, notice: 'Pizza was successfully updated.'
    else
      @toppings = Topping.all  # Re-load toppings if validation fails
      render :edit
    end
  end


  private

  def pizza_params
    params.require(:pizza).permit(:name, topping_ids: [])
  end

  def set_pizza
    @pizza = Pizza.find(params[:id])
  end

  def authorize_pizza_chef
    unless current_user&.role == 'pizza_chef' || current_user&.role == 'store_owner'
      redirect_to root_path, alert: 'Alert: User is trying to OutPizza the Hut'
    end
  end

end
