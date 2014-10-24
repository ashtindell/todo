class Task < ActiveRecord::Base
  belongs_to :user

  before_save :set_due_at # reminder: change to before_create when we cover edit/update to test before_create vs before_save

  validates :title, presence: true, length: { in: 3..254 }
  validates :location, length: { maximum: 254 }
  validates :user_id, presence: true

  def set_due_at
    # uses provided due_at or defaults to today
    self.due_at ||= Date.today
  end
end
