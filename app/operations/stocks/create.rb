# frozen_string_literal: true

module  Stocks
  class Create < ::Callable
    def initialize(user:, params:)
      @user     = user
      @params   = params
      @interest = params[:interest]
    end

    def call
      Stock.create(full_params)
    end

    private

    attr_reader :params, :user, :interest

    def full_params
      params.merge(user: user, interest: decimal_interest)
    end

    def decimal_interest
      return unless interest

      interest.to_f / StockDecorator::PERCENTS
    end
  end
end
