class Tag < ApplicationRecord
    has_many :linktags, class: "LinkTag"
    has_many :links, through: :linktags
end