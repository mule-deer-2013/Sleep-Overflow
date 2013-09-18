class Vote < ActiveRecord::Base
  attr_accessible :votable_id, :user_id, :votable_type, :up_down

  belongs_to :user
  belongs_to :votable, polymorphic: true

end
