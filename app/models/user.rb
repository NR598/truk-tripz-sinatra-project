class User < ActiveRecord::Base
  has_secure_password
  has_many :loads
end

# def password=(str)
#   @hashed_string = SecureRandom.hash_string(str)
#   self.password_digest = @hashed_string
# end
#
# def password
#   @hashed_string
# end
#
# def authenticate=(str)
#   unhashes the string from the database and compares it to the string entered here
# end
