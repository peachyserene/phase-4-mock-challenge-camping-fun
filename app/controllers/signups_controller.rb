class SignupsController < ApplicationController
    def index
        signups = Signup.all
        render json: signups, except: [:created_at, :updated_at]
    end

    def create
        signup = Signup.create(signup_params)
        render json: signup, status: :created
    end
### how to set up validators
### how to return the info for the ACTIVITY in stead of the signup
    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end
end

