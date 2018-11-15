# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  def short_info
    email
  end
end
