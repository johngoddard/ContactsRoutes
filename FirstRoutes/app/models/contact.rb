class Contact < ActiveRecord::Base
  validates :email,  uniqueness: {scope: :user_id}, presence: true
  validates :name, :user_id, presence: true

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :user 
end
