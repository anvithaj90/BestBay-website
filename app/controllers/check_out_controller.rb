class CheckOutController < ApplicationController
  # Check if the user is authenticated
  before_filter :authenticate_user!

end