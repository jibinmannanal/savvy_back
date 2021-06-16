class Api::V1::SessionsController  < ApplicationController

  def destroy
    user = current_user
    if user
      cookies.delete(:jwt)
      render json: {status: 'OK', code: 200}
    else
      render json: {status: 'session not found', code: 404}
    end
  end

  def create
  email = params["email"]
  password = params["password"]
  if email && password

     user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])

      auth_token = encode_token({user_id: user.id})
      render json: {auth_token: auth_token,user:user}, status: :ok
    else
      render json: {error: 'Login Unsuccessfull'}, status: :unauthorized
    end
  else
    render json: {status: 'specify email address and password', code: 422}
  end
end
end
