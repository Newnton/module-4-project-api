class Api::V1::ListingController < ApplicationController
  before_action :authorize_user!

  def create
    @listing = Listing.create(listing_params)
    render json: {listing: @listing}
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    render json: {listing: @listing}
  end

  def show
    render json: {listing: Listing.find(params[:id])}
  end

  def index
    render json: {listing: Listing.all}
  end

  def delete
    @listing = Listing.find(params[:id])
    @listing.destroy
    render json: {message: 'deleted listing'}
  end

  private
  def listing_params
    params.permit(:address, :zipcode, :bedrooms, :sqft, :price, :bathrooms, :type, :user_id)
  end
end
