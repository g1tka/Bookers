class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  #       POST   /books(.:format)              books#create
  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books'
  end  
    
  def index
    @books = Book.all
  end

  def show
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
