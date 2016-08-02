class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
end
