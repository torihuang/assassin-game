module UserHelper

  def current_user
    return User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def password_valid(password_input)
    password_is_six_characters = password_input.length >=6
    password_has_special_character = !!/\W/.match(password_input)
    password_has_number = /\d/.match(password_input)
    password_valid = password_has_number && password_has_special_character && password_is_six_characters
    password_valid
  end

  def authenticate
    return session[:user_id]
  end

end

helpers UserHelper
