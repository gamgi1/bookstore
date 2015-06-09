class Admin::AdministratorsController < ApplicationController
  layout 'admin'

  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      session[:administrator_id] = @administrator.id
      redirect_to admin_books_path
    else
      render :new
    end
  end

    private

    def administrator_params
      params.require(:administrator).permit(:username, :password, :password_confirmation)
    end
  end
