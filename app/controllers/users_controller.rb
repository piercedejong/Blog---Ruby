class UsersController < ApplicationController

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data["name"],
    #        email: data["email"],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end

  def create
    if params[:denied]
      redirect_to sessions_path
    else
      if !(User.find_by(email: auth_hash.info.email))
        @user = User.create_user(auth_hash)
      else
        @user = User.find_by(email: auth_hash.info.email)
      end
      session[:user_id] = @user.id
      redirect_to articles_path
    end
  end

  def index
    @user = User.find(params[:id])
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end


  def new
  end
end
