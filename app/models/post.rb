class Post < ActiveRecord::Base
  extend FriendlyID
  friendly_id :title, use: :slugged
end
