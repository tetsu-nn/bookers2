class UsersController < ApplicationController
  def show
    @user=current_user
    @user1=User.find(params[:id])
    @books=@user1.books
    @booknew=Book.new
  end

  def edit
    @user=User.find(params[:id])
    if @user.id == current_user.id
      render :edit
    else
      redirect_to user_path(current_user.id) 
    end
  end

  def index
    @user=current_user
    @users=User.all
    @booknew=Book.new
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to  user_path(@user.id) 
    else
      render :edit
    end
  end

    private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
