# frozen_string_literal: true

module Stocks
  class CompoundInterest < ::Callable
    START = 1

    delegate :duration, :unit_price, :interest, to: :stock

    def initialize(stock_id:)
      @stock_id   = stock_id
      @chart_hash = {}
    end

    def call
      time_range.each do |year|
        compound!(update_principal, year)
      end

      chart_hash
    end

    private

    attr_reader :stock_id, :chart_hash

    def time_range
      (START..duration)
    end

    def update_principal
      @update_principal ||= unit_price
      @update_principal  *= percent_multiplier
    end

    def compound!(principal, index)
      chart_hash[index] = principal.round
    end

    def percent_multiplier
      1 + interest
    end

    def stock
      @stock ||= Stock.find_by(id: stock_id)
    end
  end
end
