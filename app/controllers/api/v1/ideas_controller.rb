module Api::V1
  class IdeasController < ApplicationController
    def index
      @ideas = Idea.order("created_at DESC")
      # @ideas = Idea.all
      render json: @ideas
    end

    def create
      @idea = Idea.create(idea_params)
      render json: @idea
    end

    def update
      @idea = Idea.fing(params[:id])
      @idea.update_attributes(idea_params)
      render json: @idea
    end

    private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
  end
end
