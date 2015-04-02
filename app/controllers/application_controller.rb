class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :count_hits
	def count_hits
		@hit = PageHit.find_by_url(request.url) || PageHit.create(:url => request.url)
		PageHit.increment_counter(:count, @hit.id)
	end
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email,:password,:role) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:role) }
        end
end
