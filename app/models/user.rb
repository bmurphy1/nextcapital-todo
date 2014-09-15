class User < ActiveRecord::Base
  devise :database_authenticatable
  has_many :todos
  validates_uniqueness_of :email

  def render_json
    json = self.as_json({
      :include => { :todos => { :only => :id } },
      :except => [:created_at, :updated_at]
    })
    json['todos'] = json['todos'].map { |todo| todo['id'] }
    json.to_json
  end
end
