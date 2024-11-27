class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient

  validates :appointment_date, :location, :status, presence: true
  validates :status, inclusion: { in: %w[Scheduled Completed Cancelled], message: "%{value} is not a valid status" }
end
