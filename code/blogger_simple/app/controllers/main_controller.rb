class MainController < ActionController::Base
  protect_from_forgery

  def commands
    @the_rest = params[:the_rest]
    @output_var = request.path

    @input_params = (params.map do |k,v|
                       "#{k}: #{v}"
                     end).join(",")
  end
end
