class User < ActiveRecord::Base
    validates :username, uniqueness: true, presence: true

    has_many :comments, as: :commentable

    has_many :authored_comments,
      primary_key: :id,
      foreign_key: :author_id,
      class_name: :Comment

    has_many :contacts,
      dependent: :destroy

    has_many :contact_shares,
      dependent: :destroy

    has_many :shared_contacts,
      through: :contact_shares,
      source: :contact

    has_many :groups,
      dependent: :destroy

end
