class PurchaseController < ApplicationController
  require 'CrashCheck.rb'
  before_filter :authenticate_user!
  def add
    id = params[:id]
    
    purchase = session[:purchase] ||= {}
    purchase[id] = (purchase[id] || 0) + 1
    redirect_to :action => :index
  end
  
  def index
    @purchase = session[:purchase] || {}
  end
  
  def change
    purchase = session[:purchase]
    id = params[:id]
    quantity = params[:quantity].to_i
    if purchase and purchase[id]
      unless quantity <= 0
        purchase[id] = quantity
      else
        cart.delete id
      end
    end
    redirect_to :action => :index
  end
  
  def repayments
    purchase = session[:purchase]
    id = params[:id]
    vehicle = Vehicle.find_by_id(id)
    price = vehicle.price
     @threeYrPayment = LoanRepayments.new(price, 9, 36).calcPmts()
     @fourYrPayment = LoanRepayments.new(price, 9, 48).calcPmts()
     @fiveYrPayment = LoanRepayments.new(price, 9, 60).calcPmts()
    logger.info "********************#{@payments}"
  end
  

  
  def checkout
    flash[:notice] = "CHECK OUT IS NOT YET IMPLEMENTED!!"
    redirect_to :action => :index
  end
end
