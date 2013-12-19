module SessionsHelper

  
    def sign_in(parent)
      remember_token = Parent.new_remember_token
      cookies.permanent[:remember_token] = remember_token
      parent.update_attribute(:remember_token, Parent.encrypt(remember_token))
      self.current_parent = parent
    end
    def signed_in?
      !current_parent.nil?
    end
    def current_parent=(parent)
      @current_parent = parent
    end
    def current_parent
      remember_token = Parent.encrypt(cookies[:remember_token])
      @current_parent ||= Parent.find_by(remember_token: remember_token)
    end
    def current_parent?(parent)
    parent == current_parent
  end
    def sign_out
    self.current_parent = nil
    cookies.delete(:remember_token)
  end
   def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
