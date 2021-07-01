class Tag < ApplicationRecord
    has_many :linktags, class_name: "LinkTag"
    has_many :links, through: :linktags
end