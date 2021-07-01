class Link < ApplicationRecord
    has_many :linktags, class_name: "LinkTag"
    has_many :tags, through: :linktags
end
