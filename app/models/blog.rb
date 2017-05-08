class Blog < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :user
    default_scope -> { order(updated_at: :desc) }
end
