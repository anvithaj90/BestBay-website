# This is the controller for user
class UsersController < ApplicationController
  # Check if this user exist and valid
  before_filter :authenticate_user!
  # Profile Action
  # - Get through /users/profile
  # - sends the currently signed in user
  #   to the view, so as to display all info of the user
  def profile
    @user = current_user
  end
  # Profile update Action
  # - Get through /users/profile/edit
  # Users have password, photo and contact attribute
  def update_profile_info
    @user = current_user
    update_params = {:password => ""}
    update_params[:password] = params[:password]
    update_params[:current_password] = params[:password]
    update_params[:password_confirmation] = params[:password]
    update_params[:contact] = params[:contact]
    update_params[:photo] = params[:photo]

    @user.update_with_password(update_params)
    respond_to do |format|
      if @user.errors
        sign_in(current_user, :bypass => true)
        format.html { redirect_to :controller => "users", :action => "profile" }
        format.js
      else
        sign_in(current_user, :bypass => true)
        flash[:notice] = 'Password incorrect.'
        format.html { redirect_to :controller => "users", :action => "profile", notice: "failed" }
        format.js
      end

    end
  end
  # This will show the profile information of this user
  def profile_info
    @user = current_user
    respond_to do |format|
      format.html
    end
  end
  # This function specify the user types including basic and advanced seller
  def save_seller_type
    @user = current_user
    update_params = {:password => ""}
    update_params[:password] = params[:password]
    update_params[:current_password] = params[:password]
    update_params[:password_confirmation] = params[:password]
    update_params[:seller_type] = params[:seller_type]
    # Users can edit the seller type after successfully authenticated
    @user.update_with_password(update_params)
    respond_to do |format|
      if @user.errors
        puts "********************no error*******************"
        sign_in(current_user, :bypass => true)
        format.html { redirect_to :controller => "items", :action => "basic_information" }
        format.js
      else
        puts "********************yes error*******************"
        sign_in(current_user, :bypass => true)
        flash[:notice] = 'Password incorrect.'
        format.html { redirect_to :controller => "items", :action => "basic_information", notice: "failed" }
        format.js
      end
    end
  end

end


