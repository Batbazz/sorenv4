class UserMailer < ApplicationMailer
  def new_user_email
    @user = params[:user]

    mail(to: 'b.rieu.0@gmail.com', subject: "You got a new mail!")
  end
end
