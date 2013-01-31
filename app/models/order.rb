class Order < ActiveRecord::Base
  attr_accessible :account_id, :total, :card_holder_name, :order_number

  belongs_to :account
end
