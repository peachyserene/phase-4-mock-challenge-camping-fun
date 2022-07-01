class CampersController < ApplicationController
#GET /campers
    def index    
        campers = Camper.all
        render json: campers, except: [:created_at, :updated_at]
    end

#GET campers/:id
    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper
        else
            render json: { error: "Camper not found" }, status: :not_found
        end
    end

#POST /campers
    def create
    newCamper = Camper.create(camper_params)
    render json: newCamper, status: :created
    end
    
# Validators needed
private

    def camper_params
    params.permit(:name, :age)
    end
end
