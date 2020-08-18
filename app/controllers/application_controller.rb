class ApplicationController < ActionController::API
  include ExceptionHandler
  include Response
  include ActionController::MimeResponds
  require 'base64'
  include ActionView::Helpers::NumberHelper
  before_action :set_raven_context

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
