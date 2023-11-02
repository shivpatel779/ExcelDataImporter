class UsersController < ApplicationController
  def upload
  end
  def import
    file = params[:file]
    if file
      @import_results = User.import_from_excel(file)
      redirect_to display_users_users_path(import_results: @import_results)
    else
      flash[:error] = 'Please select a file to import.'
      redirect_to users_path
    end
  end
end
