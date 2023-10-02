class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    
end
