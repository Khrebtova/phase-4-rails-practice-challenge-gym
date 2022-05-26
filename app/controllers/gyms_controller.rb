class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        gyms = Gym.all
        render json: gyms
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy!
        head :no_content, status: :ok
    end

    def create
        gym = Gym.create!(gym_params)
        render json: gym, status: :created
    end

    def update
        gym = Gym.find(params[:id])
        gym.update!(gym_params)
        render json: gym, status: :ok
    end
    

    private

    def render_not_found_response
        render json: { errors: 'Gym not found' }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def gym_params
        params.require(:gym).permit(:name, :address)
    end
end
