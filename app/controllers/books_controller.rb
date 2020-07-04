class BooksController < ApplicationController
  before_action :fetch_all_books, only: [:index, :create]
  before_action :fetch_book, only: [:show, :edit, :update, :destroy]

  def index
    @book = Book.new
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def edit; end

  def update
    @book.title = book_params[:title]
    @book.body = book_params[:body]
    if @book.valid?
      @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy!
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private

  def fetch_book
    @book = Book.find(params[:id])
  end

  def fetch_all_books
    @books = Book.all
  end

  def book_params
    params.require(:book).permit(
        :title,
        :body,
    )
  end
end
