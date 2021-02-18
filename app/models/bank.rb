class Bank < ApplicationRecord
  before_save { bank_name.downcase! }
  default_scope -> { order(updated_at: :desc) }
  validates :bank_name,             presence: true,
                                    length: { in: 3..20 },
                                    uniqueness: { case_sensitive: false }
  validates :interest_rate,         presence: true,
                                    numericality: { greater_than: 0,
                                                    less_than_or_equal_to: 5000 }
  validates :maximum_loan,          presence: true,
                                    numericality: { greater_than_or_equal_to: 1,
                                                    less_than_or_equal_to: 500000000000 }
  validates :minimum_down_payment,  presence: true,
                                    numericality: { greater_than_or_equal_to: 0,
                                                    less_than_or_equal_to: 100 }
  validates :loan_term,             presence: true,
                                    numericality: { only_integer: true,
                                                    greater_than: 0,
                                                    less_than_or_equal_to: 240 }
end
