class Group < ActiveRecord::Base
  belongs_to :user

  has_many :group_memberships,
    dependent: :destroy

  has_many :contacts,
    through: :group_memberships,
    source: :contact
end
