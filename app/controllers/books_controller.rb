class BooksController < ApplicationController
  #       POST   /books(.:format)         books#create
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to show_book_path(@book.id)
    # to '  '文字列にしない。
    else
      @books = Book.all  #2回目の定義

      render :index#, status: :unprocessable_entity
    end
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:comment] = "Book was successfully updated."
      redirect_to show_book_path(@book.id)
    else
    
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:tell] = "Book was successfully destroyed."
#    @books = Book.all
#    render :index
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
