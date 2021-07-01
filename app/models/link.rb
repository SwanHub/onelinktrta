class Link < ApplicationRecord
    has_many :linktags, class: "LinkTag"
    has_many :tags, through: :linktags
end
