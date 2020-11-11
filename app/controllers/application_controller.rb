class ApplicationController < ActionController::API
   
    def generate_token(data)
        JWT.encode(data, ENV["TOKEN_SECRET_KEY"])
    end

    def decode_token
        token = request.headers["Authorization"]
        begin
          JWT.decode(token, ENV["TOKEN_SECRET_KEY"]).first
        rescue
          {}
        end
     end

     def get_user
        id = decode_token["id"] 
        User.find_by(id: id)
    end
end
