# == Schema Information
#
# Table name: users
#
#  id      :bigint           not null, primary key
#  balance :integer          default(0), not null
#  limit   :integer          default(0), not null
#
class User < ApplicationRecord
  has_many :transactions

  validate :limit_plus_balance_cannot_be_less_than_zero

  private

  def limit_plus_balance_cannot_be_less_than_zero
    errors.add(:balance, "can't be less than limit") if limit + balance < 0
  end
end
