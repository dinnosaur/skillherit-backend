class TopicsController < ApplicationController

    def index 
        tracks = Topic.all
        render json: tracks
    end 

end