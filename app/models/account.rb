# encoding: utf-8
class Account < ActiveRecord::Base
  strip_attributes
  # attributes :id, :name, :discord_name, :account_type, :account_hash, :credits, :created_at, :updated_at
  # type: 0 - CMDR, 1 - Player Group
  validates :name, presence: true
  validates_uniqueness_of :name
  has_many :trade_events, dependent: :destroy
  has_many :orders, dependent: :destroy
  after_create :fill_account_hash

  def type_with_name
    self.account_type == 0 ? "[CMDR] #{self.name}" : "[Group] #{self.name}"
  end

  def account_type_string
  	self.account_type == 0 ? "CMDR" : "Group"
  end

  def credit_count
    self.credits ? self.credits : 0
  end

  def fill_account_hash
    return unless self.account_hash.blank?
    self.account_hash = Digest::MD5.hexdigest("#{self.name}#{self.id}#{GENERATOR_ADDITION}")
    self.save
  end
end