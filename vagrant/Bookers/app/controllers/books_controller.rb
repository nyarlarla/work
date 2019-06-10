class BooksController < ApplicationController
  def show
  	  @book = Book.find(params[:id])
  end

  def index
  	  @books = Book.all
  	  @book = Book.new
  end

  def new
  	  @book = Book.new
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
  	 @book = Book.find(params[:id])
  	 if @book.update(book_params)
  	 flash[:notice] = "Book was successfully created."
  	end
  	 redirect_to book_path(@book.id)
  end

  def create
  	  @book = Book.new(book_params)
  	  if @book.save
  	  flash[:notice] = "Book was successfully updated."
  	  end
  	  redirect_to book_path(@book.id)
  end

  def destroy
  	  book = Book.find(params[:id])
  	  if book.destroy
  	  flash[:notice] ="Book was successfully destroyed."
  	  end
  	  redirect_to books_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
