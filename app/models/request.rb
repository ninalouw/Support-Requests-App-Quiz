class Request < ApplicationRecord
validates :name, presence: true
validates :email, presence: true

validates :department, presence: true

validates :message, presence: true

def self.search(search)
  # where(["title ILIKE?",concat('%', string , '%')])
  select(:name,:email,:department, :message).where("name ilike '%#{search}%' or email ilike '%#{search}%' or department ilike '%#{search}%' or message ilike '%#{search}%'")

end

end
