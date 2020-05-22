class ApplicationController < ActionController::API
   
    def generate_token(data)
        JWT.encode(data, "yay")
    end

    def decode_token
        token = request.headers["Authorization"]
        begin
          JWT.decode(token, "yay").first
        rescue
          {}
        end
     end

     def get_user
        id = decode_token["id"] 
        User.find_by(id: id)
    end
end
