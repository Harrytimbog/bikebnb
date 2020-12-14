class PaymentsController < ApplicationController
  skip_after_action :verify_policy_scoped, only: [:new]

  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    authorize @order
  end

  #def payment
   # @bike = Restaurant.first.bikes.first
  #end
end
