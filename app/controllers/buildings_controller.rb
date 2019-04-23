class BuildingsController < ApplicationController

  def index
    response = buildings.limit(100).to_json(except: [:created_at, :updated_at])
    render json: response
  end

  def zipcode_distribution
    response = buildings.group(:plz).count
    render json: response
  end

  def year_distribution
    grouped  = buildings.group("date(str_datum)").count.map{|k,v| [Date.parse(k).year, v]}
    response = Hash[*grouped.flatten].to_json
    render json: response
  end

  private

  def buildings
    zipcode = params[:zipcode].to_i

    if zipcode > 0
      Building.where(plz: zipcode)
    else
      Building.all
    end
  end
end
