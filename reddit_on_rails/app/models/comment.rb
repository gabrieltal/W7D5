class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :post,
    class_name: :Post,
    foreign_key: :post_id

  has_many :child_comments,
    class_name: :Comment,
    foreign_key: :parent_comment_id

  belongs_to :parent_comment,
    class_name: :Comment,
    foreign_key: :parent_comment_id,
    optional: true

end
