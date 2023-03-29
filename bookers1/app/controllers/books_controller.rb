class BooksController < ApplicationController
  def new
    @new_book = Book.new
  end

  def create
    @new_book = Book.new(book_params)
    if @new_book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
