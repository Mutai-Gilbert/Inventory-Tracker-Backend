class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(username: login_params[:username])
        if @user && @user.authenticate(login_params[:password])
            token = encode_token(user_id: @user_id)
            render json: {user: UserSerializer.new(@user), jwt: token}, status: :accepted
            
end
