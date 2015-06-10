class Admin::BooksController < ApplicationController
    layout 'admin'
    before_action :find_book, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_administrator

    def index
      if params[:order_by]
        @books = Book.all.order(params[:order_by].to_sym)
      else
        @books = Book.all
      end
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to admin_books_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @book.update(book_params)
        redirect_to admin_books_path
      else
        render :edit
      end
    end

    def show
    end

    def destroy
      @book.destroy
      redirect_to admin_books_path
    end

    private

    def find_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :pages, :price, :in_stock)
    end

end
