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
        user = get_user
        
        if get_user 
            render json: { username: user.username, token: generate_token(id: user.id),motto: user.motto, id:user.id }
        else 
            render json: {error: "go away"}, status:401 
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
