# encoding: utf-8
class TradeEvent < ActiveRecord::Base
  strip_attributes
  # attributes :id, :content, :user_id, :account_id, :created_at, :updated_at
  belongs_to :account
  belongs_to :user
end