class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
    # return auth token once user is authenticated
    def authenticate
      auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
      @current_user = AuthorizeApiRequest.new('Authorization' => auth_token).call[:user]
      render json: @current_user, scope: {
        auth_token: auth_token
      }
    end
  
    private
    def auth_params
      params.permit(:email, :password)
    end
end
