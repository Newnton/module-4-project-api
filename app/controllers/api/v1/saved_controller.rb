class Api::V1::SavedController < ApplicationController
  before_action :authorize_user!

  def user_listings
    @listings = SaverListing.all.where(:user_id == params[:id])
    @listings = @listings.map do |listing|
      Listing.find(listing.listing_id)
    end
    render json: {listings: @listings}
  end

  def listing_users
    @users = SaverListing.all.where(:listing_id == params[:id])
    @users = @users.map do |user|
      u = User.find(user.user_id)
      {id: u.id, username: u.username}
    end
    render json: {users: @users}
  end
  def create
    @saver_listing = SaverListing.create(saved_params)
    render json: {saver_listing: @saver_listing}
  end

  private
  def saved_params
    params.permit(:user_id, :listing_id)
  end
end
