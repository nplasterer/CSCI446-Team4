class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :sort_column, :sort_direction
  
  def index
    @animals = Animal.order(sort_column + " " + sort_direction)
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  
  def sort_column
    Animal.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end

end
