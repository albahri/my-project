class SessionsController < ApplicationController

# def create

#   user = User.authenticate(params[:email], params[:password])
#   if user
#     session[:user_id] = user.id
#     redirect_to root_url, :notice => "Logged in!"
#   else
#     flash.now.alert = "Invalid email or password"
#     render "new"
#   end
# end

# def destroy
#   session[:user_id] = nil
#   redirect_to root_url, :notice => "Logged out!"
# end
end

def create
  auth = request.env["omniauth.auth"]
  user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  session[:user_id] = user.id
  redirect_to root_url, :notice => "Signed in!"
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Signed out!"
end
