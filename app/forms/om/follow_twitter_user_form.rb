# frozen_string_literal: true

class Om::FollowTwitterUserForm < Om::Form
  attribute :account_id, :integer
  attribute :username, :string

  validates_presence_of :username

  def perform
    service = Om::Twitter::FollowUser.new(account_id, username)
    return true if service.perform

    service.errors.each do |error|
      errors.add(:base, error)
    end
    false
  end
end
