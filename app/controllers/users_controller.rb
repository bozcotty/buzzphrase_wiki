class UsersController < ApplicationController
# a page showing list of all users/authors, with links to individual author show pages

  def index
    @users = User.all
  end

# show a page for each user with their name and topics they've written on
  def show
    @user = User.find(params[:id])
  end
end
