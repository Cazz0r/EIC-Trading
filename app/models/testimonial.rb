# encoding: utf-8
class Testimonial < ActiveRecord::Base
  strip_attributes
  # attributes :id, :content, :account_id, :order_id, :created_at, :updated_at
  belongs_to :account, optional: true
  belongs_to :order, optional: true
end