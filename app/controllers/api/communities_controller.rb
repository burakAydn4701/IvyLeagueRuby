module Api
  class CommunitiesController < Api::BaseController
    before_action :set_community, only: [:show, :edit, :update, :destroy]

    def index
      @communities = Community.all
      render json: @communities
    end

    def show
      render json: @community
    end

    def create
      @community = Community.new(community_params)
      
      if @community.save
        render json: @community, status: :created
      else
        render json: { errors: @community.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @community.update(community_params)
        render json: @community
      else
        render json: { errors: @community.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @community.destroy
      head :no_content
    end

    private

    def set_community
      @community = Community.find(params[:id])
    end

    def community_params
      params.require(:community).permit(:name, :description, :rules)
    end
  end
end 