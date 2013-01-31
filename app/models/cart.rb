class Cart < ActiveRecord::Base
  attr_accessible :account_id

  belongs_to :account
  has_many :line_items
end
