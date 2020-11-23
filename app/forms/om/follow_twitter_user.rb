# frozen_string_literal: true

class Om::FollowTwitterUser < Om::Form
  attribute :username, :string

  validates_presence_of :username

  def perform
    Om::Twitter::FollowUser.new(username).perform
  end
end
