class Goal < ActiveRecord::Base
  validates :title, presence: true

  has_many :shared_mails
end
