class JsonWebToken
 JWT_SECRET = ENV["jwt_secret"]

 def self.encode(payload)
  JWT.encode(payload, JWT_SECRET)
 end

def self.decode(token)
 body = JWT.decode(token, JWT_SECRET)[0]
 HashWithIndifferentAccess.new body
rescue JWT::DecodeError, JWT::VerificationError => e
 raise ExceptionHandler::DecodeError, e.message
end

# def self.decode(token)
#  return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
# rescue
#  nil
# end

end