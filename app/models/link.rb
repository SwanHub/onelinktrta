class Link < ApplicationRecord
    has_many :linktags
    has_many :tags, through: :linktags
end
