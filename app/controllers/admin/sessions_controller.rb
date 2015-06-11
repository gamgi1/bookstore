class Admin::SessionsController < ApplicationController
  layout 'admin'
  def new

  end

  def create
    @administrator = Administrator.where(username: params[:username]).first
    if @administrator.present? && @administrator.authenticate(params[:password])
      session[:administrator_id] = @administrator.id
      flash[:success] = "Administrator successfully signed in!"
      redirect_to admin_books_path
    else
      flash[:danger] = "You aint no administrator friend..."
      render :new
    end
  end

    def destroy
      session[:administrator_id] = nil
      redirect_to admin_login_path
    end
  end
