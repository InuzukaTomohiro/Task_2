class BooksController < ApplicationController
  def index
    @books = Book.all
    def new
      @book = Book.new
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] =  "Book was successfully create."
    else
      render :new
    end
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:notice] =  "Book was successfully update."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: 
    flash[:notice] =  "Book was successfully destroy."
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end

