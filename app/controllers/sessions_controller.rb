class SessionsController < ApplicationController
    
    def index 
        sessions = Session.all
        render json: sessions
    end 

    def create 
        
        track = Track.find_by(findTrackParams )
        newTime = track.time + updateTrackParams[:time]
        track.update(time: newTime)
        session = Session.create(createSessionParams)
        note = Note.new(session_id: session.id)
        note.update(createNotesParams)
        Url.createLinks(params[:links],session.id )
        

        if session.save
            render json: {created_at: session.created_at}
        else 
            render json: {error: "Could not create"}
        end
    end 


    private 
    
    def createSessionParams
        params.require(:session).permit(:date, :track_id)
    end

    def findTrackParams
        params.permit(:track_id)
    end

    def createNotesParams
        params.require(:notes).permit(:content)
    end 

    def updateTrackParams 
        params.permit(:time)
    end 

end
