class Api::V1::SavedController < ApplicationController
  before_action :authorize_user!

  def listing_users
    @users = SaverListing.all.where(:listing_id == params[:id])
    @users = @users.map do |user|
      u = User.find(user.user_id)
      {id: u.id, username: u.username}
    end
    render json: {users: @users}
  end

  def create
    if SaverListing.find_by(listing_id: saved_params, user_id: current_user.id) == nil
      @saver_listing = SaverListing.create(listing_id: saved_params, user_id: current_user.id)
      render json: {saver_listing: @saver_listing}
    else
      render json: {error: 'already saved to favorites'}
    end
  end

  private
  def saved_params
    params.require(:listingId)
  end
end
