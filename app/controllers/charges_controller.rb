class ChargesController < ApplicationController
  before_action :set_product, only: [:new, :show, :edit, :update, :destroy]
  def new
    @amount = @product.price
  end

  def create
    # Amount in cents
    @amount = params[:price].to_i * 100
    puts "111111111111"
    logger.debug(@amount)
    puts "111111111111"

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'AUD'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :qty, :description, :seller_id, :picture)
    end

end
