class BuildingsController < ApplicationController

  def index
    @buildings = Building.limit(100).to_json(except: [:created_at, :updated_at])
    render json: @buildings
  end

  def per_zipcode
    @buildings = Building.all.group(:plz).count
    render json: @buildings
  end
end
