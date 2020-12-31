class WritersController < ApplicationController
  before_action :authenticate_writer!
  load_and_authorize_resource

  def destroy
    @writer.destroy!
    redirect_back(fallback_location: dashboard_path)
  end

  def approve
    if request.method_symbol == :delete
      @writer.destroy!
    elsif request.method_symbol == :post
      if @writer.has_role? :stranger
        @writer.remove_role :stranger
      end
      @writer.add_role :friend
    end
    redirect_back(fallback_location: dashboard_path)
  end
end
