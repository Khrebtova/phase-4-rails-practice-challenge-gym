class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        memberships = Membership.all
        render json: memberships
    end

    def create 
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    def destroy
        membership = Membership.find(params[:id])
        membership.destroy!
        head :no_content
    end

    private

    def membership_params
        params.require(:membership).permit(:charge, :client_id, :gym_id)
    end

    def render_not_found_response
        render json: { errors: 'Not found' }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
