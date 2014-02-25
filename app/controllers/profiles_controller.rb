class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @profiles= User.all_except(current_user)
  end
  
  def show
    #@user = User.find(params[:id])
    @twets = Twet.where(user_id: params[:id]).load
  end
  
  
end