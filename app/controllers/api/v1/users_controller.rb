class Api::V1::UsersController  < ApplicationController

  def create
    user = User.new(email:params[:email],name:params[:name],password:params[:password],password_confirmation:params[:password_confirmation])
    if user.save
      auth_token = encode_token({user_id: user.id})

      render json: { auth_token: auth_token,user:user,message: 'User created successfully' },
             status: :ok
    else
      render json: { errors: user.errors.full_messages },
             status: :bad_request
    end
  end

end
