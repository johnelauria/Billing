class Cart < ActiveRecord::Base
  attr_accessible :account_id

  include ActiveMerchant::Billing::Integrations

  belongs_to :account
  belongs_to :order
  has_many :line_items, dependent: :destroy
end
