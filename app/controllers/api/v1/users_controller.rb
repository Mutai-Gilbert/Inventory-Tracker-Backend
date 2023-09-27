class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user) }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :unprocessable_entity
        end
   end
   
   private
   
   def user_params
         params.require(:user).permit(:username, :password, :email)
   end
end

{
    "user": {
      "username": "Gilloh",
      "email": "mutai@gmail.com",
      "password": "123456"
    }
  }