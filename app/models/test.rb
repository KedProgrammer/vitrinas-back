# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :helo

  def test
    'hello'
  end
end
