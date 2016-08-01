class User < ActiveRecord::Base
    validates :username, uniqueness: true, presence: true

    has_many :contacts,
      dependent: :destroy

    has_many :contact_shares,
      dependent: :destroy

    has_many :shared_contacts,
      through: :contact_shares,
      source: :contact
end
