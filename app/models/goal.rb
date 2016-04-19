class Goal < ActiveRecord::Base
  validates :title, presence: true

  has_many :shared_mails
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  
  accepts_nested_attributes_for :shared_mails, reject_if: proc { |attributes| attributes['mail_addr'].blank? }, allow_destroy: true

  def editable_by?(user)
    user && user == owner
  end

  def completed?
    !completed_at.blank?
  end
end
