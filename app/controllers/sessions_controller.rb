class SessionsController < ApplicationController
    
    def index 
        sessions = Session.all
        render json: sessions
    end 

    def show
        user = get_user
        session = Session.find_by(id: params[:id])
    
        if session && user 
            render json: session.to_json(include: {track:{include: [:skill]},notes:{except:[:updated_at]},urls:{except:[:updated_at]}})
                 
        else
            render json: {error: "session not found"}
        end
    end 


    def create 
        track = Track.find_by(id: findTrackParams[:track_id] )

        distractionTime = track.distraction + updateTrackParams[:distraction]   
        newTime = (track.time + updateTrackParams[:time]) - updateTrackParams[:distraction] 
        track.update(time: newTime, distraction: distractionTime) 
       
        session = Session.create(createSessionParams) 
        note = Note.new(session_id: session.id)
        note.update(createNotesParams)
        Url.createLinks(params[:links],session.id )

        if session.save
            render json: track
        else 
            render json: {error: "Could not create"}
        end
    end 

    private 
    
    def createSessionParams
        params.require(:session).permit(:date, :track_id)
    end

    def findTrackParams
        params.require(:session).permit(:track_id)
    end

    def createNotesParams
        params.require(:notes).permit(:content)
    end 

    def updateTrackParams 
        params.permit(:time, :distraction)
    end 

end
