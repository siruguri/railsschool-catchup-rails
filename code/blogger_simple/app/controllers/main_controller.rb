class ThisWontWorkMainController < ActionController::Base
  protect_from_forgery

  def commands
    @the_rest = params[:the_rest]
    @output_var = request.path
  end
end
