class Car < ApplicationRecord
    has_many :car_parts

    # Default scope to order by most recently created cars first
    # default_scope { order(created_at: :desc)}
end