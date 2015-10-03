class UserController < ApplicationController
  def login
    
  end
  
  def admin_login
    session[:login]=1
    session[:purchase]=nil
    
    flash[:notice] = "Admin user successfully logged in, purchase reset."
    
    redirect_to :controller => :vehicles
  end
  
  def logout
    session[:login] = nil
    session[:purchase]=nil
    flash[:notice] = "User logged out, purchase reset"
    redirect_to :controller => :vehicles
  end

end
