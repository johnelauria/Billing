class Order < ActiveRecord::Base
  attr_accessible :account_id, :total

  belongs_to :account
end
