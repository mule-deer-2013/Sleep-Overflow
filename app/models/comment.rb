class Comment < ActiveRecord::Base
  attr_accessible :user_id, :commentable_id, :commentable_type, :content

  belongs_to :user
  belongs_to :commentable, polymorphic: true
end