class User < ApplicationRecord
  validates :username, presence: true
  validates :session_token, presence: true

end
