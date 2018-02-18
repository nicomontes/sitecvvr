class ChargesController < ApplicationController
  
  def new
  end

  def create

  if params[:sku] === "sku_C9HFhroLn8kXUG"
    @amount = 8000
  elsif params[:sku] === "sku_C9HH44O1c5V9zg"
    @amount = 15000
  elsif params[:sku] === "sku_CEY85nZMAKSm22"
    @amount = 17500
  end
    
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken],
  )
  
  Stripe::Order.create(
    :currency => 'eur',
    :customer    => customer.id,
    :email => params[:stripeEmail],
    :items => [
      {
        :type => 'sku',
        :parent => params[:sku]
      }
    ],
    :shipping => {
      :name => params[:stripeShippingName],
      :address => {
        :line1 => params[:stripeShippingAddressLine1],
        :city => params[:stripeShippingAddressCity],
        :country => params[:stripeShippingAddressCountry],
        :postal_code => params[:stripeShippingAddressZip]
      }
    }
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :currency    => 'eur'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    render 'static_pages/baptism'
  end
  
  render 'static_pages/baptism'
  
end
