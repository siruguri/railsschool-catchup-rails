class CityController < ApplicationController
  def get_population
    cityname= params[:name]
    c=Town.find_by_name(cityname)

    @population=c.population
  end

  def get_mayor
    cityname= params[:name]

    c=Town.find_by_name(cityname)

    x =c.mayor
    @mayor_name = x.name
    @mayor_age = x.age
  end

  def edit_mayor
    if params[:cityname]
      @town=Town.find_by_name params[:cityname]
      @mayor = @town.mayor
    else
      c=Town.find params[:city][:id]
      puts ">>> #{params}"

      if !c.mayor
        m = Mayor.new

        m.save
        c.mayor = m
        c.save
      else
        m = c.mayor
      end
      
      m.name = params[:city][:mayor][:name]
      m.save

      @town=c
      @mayor=m
    end
  end
end
