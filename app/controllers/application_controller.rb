class ApplicationController < ActionController::Base

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end

end
