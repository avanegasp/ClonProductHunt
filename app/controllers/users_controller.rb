class UsersController < ApplicationController
  #inicializamos una variable user xq la vamos a utilizar en la vista
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
        if @user.save
        redirect_to root_path
        else
        render :new
      end
    end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :twitter_handle )
  end
end
