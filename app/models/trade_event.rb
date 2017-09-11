# encoding: utf-8
class TradeEvent < ActiveRecord::Base
  strip_attributes
  # attributes :id, :content, :user_id, :account_id, :order_id, :created_at, :updated_at
  belongs_to :user
  belongs_to :account, optional: true
  belongs_to :order, optional: true
end