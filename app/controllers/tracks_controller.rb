class TracksController < ApplicationController

    def index 
        tracks = Track.all
         render json: tracks.to_json(include: {skill:{only: [:id,:title]}})
    end 
     
    def create 
        user = get_user
        track = Track.new(user_id: user.id, skill_id: params[:id])

        if track.save
            render json: track , include: [:skill]
        else 
            render json: {error: "Could not create"}
        end
    end 

    def update 
        track = Track.find_by(id:params[:id])
        track.update(completed: true)

        if track 
            render json: track 
        else 
            render json: {error: "Could not update"}
        end
    end 


    def user_track
        user = get_user 
        track = Track.find_by(user_id: user.id, completed:false )
        
        if track 
           render json:track.to_json(include: {skill:{only: [:id,:title]}})
        else 
           render json: {error: "track not found"} , status:400 
        end
    end 

    def user_tracks
        user = get_user 
        tracks = Track.where(user_id: user.id, completed:true ).all
        if tracks
            render json: tracks.to_json(include: {skill:{only: [:id,:title]},sessions: { include: [:notes,:urls]}})
        else
            render json: {error: "Tracks not found"} , status:400 
        end 

    end 

    


end
