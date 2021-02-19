class Calculation < ApplicationRecord
  belongs_to :bank
  default_scope -> { order(updated_at: :desc) }
  validates :initial_loan,          presence: true,
                                    numericality: { greater_than_or_equal_to: 1,
                                                    less_than_or_equal_to: 500000000000 }
  validates :down_payment,          presence: true,
                                    numericality: { greater_than_or_equal_to: 1,
                                                    less_than_or_equal_to: 500000000000 }
end
