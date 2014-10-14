class OldItemsController < ApplicationController
  before_filter :admin_user

  def index

  	@csv = OldItem.order(:id)

    respond_to do |format|
      # format.js
      # format.html # index.html.erb
      # format.json { render json: @old_items }
      # Export statistics to CSV file
      format.csv { send_data @csv.to_csv }
      format.xls { send_data @csv.to_csv(col_sep: "\t") }
    end
  end

  private

    # Redirect current user to the home page unless the user is an admin
    def admin_user
      redirect_to(root_path) unless is_admin?
    end
end
