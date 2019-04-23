class BuildingsController < ApplicationController

  def index
    response = Building.limit(100).to_json(except: [:created_at, :updated_at])
    render json: response
  end

  def zipcode_distribution
    response = Building.all.group(:plz).count
    render json: response
  end

  def year_distribution
    grouped  = Building.group("date(str_datum)").count.map{|k,v| [Date.parse(k).year, v]}
    response = Hash[*grouped.flatten].to_json
    render json: response
  end
end
