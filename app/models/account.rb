# frozen_string_literal: true

class Account < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
