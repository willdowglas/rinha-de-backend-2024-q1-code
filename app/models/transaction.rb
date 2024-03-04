# == Schema Information
#
# Table name: transactions
#
#  id          :bigint           not null, primary key
#  amount      :integer          default(0), not null
#  description :string(10)       not null
#  kind        :boolean          not null
#  created_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_transactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Transaction < ApplicationRecord
  belongs_to :user

  validates :description, presence: true, length: { in: 1..10 }

  enum kind: { c: true, d: false }
end
