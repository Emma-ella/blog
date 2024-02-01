class Post < ApplicationRecord
    belongs_to :bblog, :optional => true

    has_many :comments, dependent: :destroy
end
