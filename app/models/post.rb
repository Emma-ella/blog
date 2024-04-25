class Post < ApplicationRecord
    belongs_to :bblog
    has_many :comments, dependent: :destroy
    has_and_belongs_to_many :tags, join_table: "custom_posts_tags"
    belongs_to :category   
end
