class PizzasController < ApplicationController
  before_action :authorize_pizza_chef

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
