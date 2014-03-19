class User < ActiveRecord::Base
  devise :database_authenticatable
  has_many :todos
end
