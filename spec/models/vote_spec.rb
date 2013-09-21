require "spec_helper"

describe Vote do 
  it { should belong_to :user }
  it { should belong_to :votable }
  it { should validate_presence_of :votable_id }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :votable_type }
  it { (:updown).should_not be_nil }
  it { should validate_uniqueness_of(:user_id).scoped_to(:votable_id, :votable_type)}
end

