class UserController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.with(user: @user).new_user_email.deliver_later

      flash[:success] = "Merci pour votre message ! Je vous répondrai dans les plus brefs délais."
      redirect_to root_path
    else
      flash.now[:error] = "Il manque au moins une information à votre message."
      render 'pages/home'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :message)
  end
end
