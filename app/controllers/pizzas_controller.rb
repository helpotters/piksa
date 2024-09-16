class PizzasController < ApplicationController
  before_action :authorize_pizza_chef

  def index
    @pizzas = Pizza.all
  end

  def new
  end

  private

  def authorize_pizza_chef
    unless current_user&.role == 'pizza_chef' || current_user&.role == 'store_owner'
      redirect_to root_path, alert: 'Alert: User is trying to OutPizza the Hut'
    end
  end

end
