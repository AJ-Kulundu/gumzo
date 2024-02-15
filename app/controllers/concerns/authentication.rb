module Authentication
    extend ActiveSupport::Concern

    included do
        helper_method :current_user, :user_signed_in?
    end

    def sign_in(user)
        Current.user = user
        reset_session
        cookie.encrypted[:user_id] = user.id
    end

    def sign_out(user)
        Current.user = nil
        reset_session
        cookies.delete(:user_id)
    end

    def authenticated_user!
        redirect_to new_session_path, alert: "You must sign in" if current_user.blank?
    end

    def redirect_if_authenticated
        redirect_to root_path if user_signed_in?
    end

    private

    def user_signed_in?
        current_user.present?
    end

    def current_user
        Current.user ||= authenticate_user_from_session
    end

    def authenticate_user_from_session
        User.find_by(id: cookies.encrypted[:user_id])
    end

end