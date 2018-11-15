# frozen_string_literal: true

module Stocks
  class IndexFacade
    def initialize(params:, user:)
      @params = params
      @user   = user
    end

    def stocks
      @stocks ||= user_stocks&.decorate
    end

    private

    attr_reader :user, :params

    def user_stocks
      Stock.where(user: user)
    end
  end
end
