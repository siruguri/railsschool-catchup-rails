class MayorController < ApplicationController

  def show
    city_record = City.find_by_cityname(params[:city_name])
    @mayor = city_record.mayorname
  end
end
