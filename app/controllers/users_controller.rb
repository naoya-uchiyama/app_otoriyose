class UsersController < ApplicationController
  def show
    @user = User.all
  end

  def destroy
  end
end