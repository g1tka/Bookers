class BooksController < ApplicationController
  #       POST   /books(.:format)              books#create
  def create
    book = Book.new(book_params)
    book.save
    redirect_to show_book_path(book.id)
    # to '  'これがそのままリンクになる。文字列。
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
