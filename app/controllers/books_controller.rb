class BooksController < ApplicationController
  #       POST   /books(.:format)              books#create
  def create
    book = Book.new(book_params)
    book.save
    redirect_to show_book_path(book.id)
    # to '  '文字列にしない。
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to show_book_path(book.id)
    # フラッシュメッセージつけたい↑
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
