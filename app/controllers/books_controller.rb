class BooksController < ApplicationController
  def create
    flash[:notice] = "You have created book successfully."
    @book=Book.new(book_params)
    @book.user_id= current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books=Book.all
      render :index
    end
  end

  def index
    @user = current_user
    @books=Book.all
    @book=Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end

  def show
    @user = current_user
    @book=Book.find(params[:id])
    @book_comment=BookComment.new
    @booknew=Book.new
  end

  def destroy
     book= Book.find(params[:id])
     book.destroy
     redirect_to books_path
  end  

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
