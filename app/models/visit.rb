class Visit < ActiveRecord::Base
  validates :visitor_id, :profile_id, presence: true
  validates :visitor_id, uniqueness: { scope: :profile_id }
  belongs_to :profile
  belongs_to :visitor, class_name: 'Profile', foreign_key: :visitor_id


  def self.create_or_update(visitor_id, profile_id)
    visit = Visit.where(visitor_id: visitor_id, profile_id: profile_id).first
    if visit
      visit.update_attributes(updated_at: Time.now)
    else
      Visit.create(visitor_id: visitor_id, profile_id: profile_id)
    end
  end
end
