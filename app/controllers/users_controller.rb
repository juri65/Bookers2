class UsersController < ApplicationController
   
  def create
      @user = User.new(user_params)
      @user = current_user.id
    if @user.save
      redirect_to user_path(@user.id)
    else
      @user = current_user
      render :index
    end  
  end
    
  def index
    @users = User.all
    @user = current_user
  end 
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
   redirect_to user_path(@user.id)
   else
    render :index
   end
  end 
   
   private
   
   def user_params
     params.require(:user).permit(:name, :profile_image, :introduction)
   end 
   
end
  
  
  
