class Task < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true, uniqueness: true
  validates :due_date, presence: true
  validate :due_date_cannot_be_in_the_past

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end

  private

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end
end
