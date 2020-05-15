class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users
    end

    def create
        
        user = User.new(createUserParams)
        if user.save 
            render json: {username: user.username , token: generate_token(id: user.id),motto: user.motto, email: user.email,id: user.id  }
        else
            render json: {errors: user.errors.full_messages }, status:400 
        end
    end

    def sign_in 
        user = User.find_by(username: signInParams[:username])
     
        if user && user.authenticate(signInParams[:password])
            render json: { username: user.username, token: generate_token(id: user.id),motto: user.motto, id: user.id }
        else 
            render json: {error: "username or password is incorrect"}, status: 400
        end
    end

    def validate 
        if get_user 
            avatar = get_user.avatar.attached? ? url_for(get_user.avatar) : nil
            render json: {username: get_user.username, token: generate_token(id: get_user.id), id: get_user.id, bio: get_user.bio, dob: get_user.dob, email:get_user.email, avatar: avatar}
        else 
            render json: {error: "go away"}
        end
    end

    private 

    def signInParams 
        params.permit(:username, :password)
    end


    def createUserParams
        params.permit(:username, :email, :motto, :password, :password_confirmation)
    end

end
