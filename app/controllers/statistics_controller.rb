# app/controllers/statistics_controller.rb

class StatisticsController < ApplicationController
  
 
  # Item deletion feedback form
  def reason_for_deletion
      render 'deletion'
  end

  # Collect item deletion reason from feedback form
  def deletion_results
     # User selected cancel
     if params[:commit].eql?('Cancel')
        # Redirect user to home page
        respond_to do |format|
           format.html { redirect_to root_path }
        end
     # User selected Submit
     else
       # Find the copy of the item that got deleted
       @olditem = OldItem.find(params[:id])
       # Update the item with the deletion reason specified by the user
       @olditem.update_attributes(:reason => params[:reason])

        # Redirect user to home page
        respond_to do |format|
           format.html { redirect_to root_path, notice: 'Thank You!'}
        end
     end
  end
  
 
end
