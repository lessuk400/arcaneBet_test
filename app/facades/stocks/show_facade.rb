# frozen_string_literal: true

module Stocks
  class ShowFacade
    delegate :name,     :interest,   :humanized_interest,
             :duration, :unit_price, to: :stock, prefix: true, allow_nil: true

    def initialize(stock_id:)
      @stock_id = stock_id
    end

    def chart_params
      ::Stocks::CompoundInterest.call(stock_id: stock.id)
    end

    private

    attr_reader :stock_id

    def find_stock
      @find_stock ||= Stock.find_by(id: stock_id)
    end

    def stock
      @stock ||= find_stock&.decorate
    end
  end
end
