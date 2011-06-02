class UsersController < ApplicationController
  def show
    @identifier = params[:user_name] ? params[:user_name] : params[:id]
    @user = TwitterUser.new(@identifier)
    # @user = Twitter.user(params[:user_name])
    respond_to do |format|
      format.json { render :json => @user.to_json }
    end
  end
end
