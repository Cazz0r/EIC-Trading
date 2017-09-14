# encoding: utf-8
class Order < ActiveRecord::Base
  strip_attributes
  # attributes :id, :description, :account_id, :user_id, :order_type, :status, :order_hash, :created_at, :updated_at
  # order_type: 0 - order, 1 - contribution
  # status: 0 - open, 1 - underway, 2 - closed, 3 - canceled
  # platform: 0 - PC, 1 - XBOX, 2 - PS4
  has_many :trade_events, dependent: :destroy
  has_many :testimonials, dependent: :destroy
  belongs_to :user
  belongs_to :account
  after_create :fill_order_hash

  def fill_order_hash
    return unless self.order_hash.blank?
    self.order_hash = Digest::MD5.hexdigest("#{self.created_at.to_s}#{self.id}#{GENERATOR_ADDITION}")
    self.save
  end

  def type_text
    return "Order" if self.order_type == ORDER_BUY
    return "Contribution" if self.order_type == ORDER_CONTRIBUTE
  end

  def status_text
    return "Pending" if self.status == ORDER_OPEN
    return "Underway" if self.status == ORDER_UNDERWAY
    return "Complete" if self.status == ORDER_CLOSED
    return "Canceled" if self.status == ORDER_CANCELED
  end

  def platform_text
    return "PC" if self.platform == ORDER_PLATFORM_PC
    return "XBOX" if self.platform == ORDER_PLATFORM_XBOX
    return "PS4" if self.platform == ORDER_PLATFORM_PS4
  end

  def is_open
    self.status == ORDER_OPEN || self.status == ORDER_UNDERWAY
  end
end