class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        clients = Client.all
        render json: clients
    end

    def show
        client = Client.find(params[:id])
        render json: client
    end

    def destroy
        client = Client.find(params[:id])
        client.destroy!
        head :no_content, status: :ok
    end

    def create
        client = Client.create!(client_params)
        render json: client, status: :created
    end

    def update
        client = Client.find(params[:id])
        client.update!(client_params)
        render json: client, status: :ok
    end

    private

    def render_not_found_response
        render json: { errors: 'Client not found' }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def client_params
        params.require(:client).permit(:name, :age)
    end
end
