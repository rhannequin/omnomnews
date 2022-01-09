# frozen_string_literal: true

class AccountPasswordHash < ApplicationRecord
  belongs_to(
    :account,
    class_name: :Account,
    foreign_key: :id,
    inverse_of: :account_password_hash
  )

  validates :password_hash, presence: true
end
