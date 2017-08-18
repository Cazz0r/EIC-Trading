# encoding: utf-8
class Account < ActiveRecord::Base
  strip_attributes
  # attributes :id, :name, :discord_name, :account_type, :credits, :created_at, :updated_at
  # type: 0 - CMDR, 1 - Player Group
  validates :name, presence: true
  validates_uniqueness_of :name
  has_many :trade_events, dependent: :destroy

  def type_with_name
    self.account_type == 0 ? "[CMDR] #{self.name}" : "[Group] #{self.name}"
  end
end