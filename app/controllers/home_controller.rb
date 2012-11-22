class HomeController < ApplicationController
  def index
    @latest = Code.order('updated_at desc').limit(10)
  end

  def show
    id = params[:id]
    redirect_to "/code/show/#{id}" if id
  end
end