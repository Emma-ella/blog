class Post < ApplicationRecord
    belongs_to :bblog
    has_many :comments, dependent: :destroy
end
