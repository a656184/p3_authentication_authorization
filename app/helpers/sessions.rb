helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    User.find_by_id(session[:user_id])
  end

  def log_in(user, password)
    if User.authenticate(user.email, password)
      session[:user_id] = user.id
    else
      nil
    end
  end

  def log_out
    session.clear
  end

end

