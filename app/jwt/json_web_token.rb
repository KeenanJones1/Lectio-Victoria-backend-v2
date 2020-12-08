class JsonWebToken
 JWT_SECRET = ENV["JWT_SECRET"]

 def self.encode(payload)
  JWT.encode(payload, JWT_SECRET)
 end

def self.decode(token)
 body = JWT.decode(token, JWT_SECRET)[0]
 HashWithIndifferentAccess.new body
rescue JWT::DecodeError, JWT::VerificationError => e
 raise ExceptionHandler::DecodeError, e.message
end

end