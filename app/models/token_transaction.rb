class TokenTransaction < ApplicationRecord
  self.implicit_order_column = 'time'

  scope :successful, -> { where(success: true) }

  def self.average_spent_gas
    gas_burnt = self
      .successful                # Only look at successful transactions,
      .where.not(gas_burnt: nil) # where there was some gas burnt,
      .last(30)                  # last 30,
      .pluck(:gas_burnt)         # get only the 'gas_burnt' attributes,
      .map(&:to_i)               # and convert from string to integer.

    # average that array: take the sum of the gas burnt, and divide by the total
    gas_burnt.inject(:+) / gas_burnt.size
  end

  def formatted_deposit
    deposit.to_i / 1e24
  end
end
