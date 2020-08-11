class OrdersController < ApplicationController
  skip_after_action :verify_policy_scoped, only: [:create, :show]

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

  def create
    bike = Bike.find(params[:bike_id])
    order  = Order.create!(bike: bike, bike_sku: bike.sku, amount: bike.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: bike.sku,
        images: [bike.photo],
        amount: bike.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
    authorize bike
  end
end
