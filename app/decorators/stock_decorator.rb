# frozen_string_literal: true

class StockDecorator < ApplicationDecorator
  PERCENTS             = 100.0
  PERCENTAGE_PRECISION = 2

  def humanized_interest
    interest_with_precision % interest_in_percents
  end

  private

  def interest_in_percents
    interest * PERCENTS
  end

  def interest_with_precision
    "%.#{PERCENTAGE_PRECISION}f%%"
  end
end
