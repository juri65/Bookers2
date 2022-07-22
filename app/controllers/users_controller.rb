class UsersController < ApplicationController
  
  def create
    　@user = login(params[:name], params[:password])
    　if @user
    　  redirect_back_or_to root_path, success: t('.create.success')
    　else
    　  　flash.now[:danger] = t('.create.fail')
    　  　render :top
    　end
　end 
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
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
     params.require(:user).permit(:name, :profile_image)
   end 
   
end
  
  
  
