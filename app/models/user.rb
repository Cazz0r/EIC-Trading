# encoding: utf-8
class User < ActiveRecord::Base
  include PasswordAndAuthPolicy
  strip_attributes
  # attributes :id, :username, :image_url, :rank, :tags, :admin, :created_at, :updated_at
  validates :username, presence: true
  validates_uniqueness_of :username
end