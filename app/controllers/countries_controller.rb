class CountriesController < ApplicationController
  def index
    countries = Country.all
    render json: countries
  end

  def show
    country = Country.find_by(id: params[:id])
    render json: country, include: :articles
  end
end
