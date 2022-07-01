class ActivitiesController < ApplicationController
#GET /activities
    def index
        activs = Activity.all
        render json: activs, except: [:created_at, :updated_at]
    end

#DELETE /activities/:id
    def destroy
        activ = Activity.find_by(id: params[:id])
        if activ
            activ.destroy
            
            render json: {}
        else
            render json: { error: "Activity not found" }, status: :not_found
        end
    end
    ### how do i destroy all associated signups along with the activity
end
