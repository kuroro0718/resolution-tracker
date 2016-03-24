class Goal < ActiveRecord::Base
  validates :title, presence: true

  has_many :shared_mails
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  def editable_by?(user)
    user && user == owner
  end
end
