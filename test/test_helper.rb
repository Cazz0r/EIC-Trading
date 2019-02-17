ENV["RAILS_ENV"] = "test"
ENV["API_TOKEN"] = "test_token"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/pride"
require "database_cleaner"
require "faker"

# Mute deprecation notices in tests
ActiveSupport::Deprecation.silenced = true
dev_null = Logger.new("/dev/null")
Rails.logger = dev_null
ActiveRecord::Base.logger = dev_null

module AroundEachTest
  def before_setup
    super
    DatabaseCleaner.clean
    DatabaseCleaner.start
  end
end

DatabaseCleaner.strategy = :transaction

class Minitest::Test
  include AroundEachTest
end

class ActiveSupport::TestCase
  extend MiniTest::Spec::DSL
  ActiveRecord::Migration.check_pending!
  self.fixture_path = "test/fixtures"
  fixtures :all

  # def signin(user)
  #   session[:identity] = user.id
  # end

  # def signout
  #   session[:identity] = nil
  # end

  def gen_user
    User.create({username: "CMDR-#{(Random.rand * 1000).round}", rank: "Private", tags: "Fun"})
  end

  def gen_account
    Account.create({name: "ACNT-#{(Random.rand * 1000).round}", discord_name: "@testacnt", account_type: (Random.rand * 1).round, credits: (Random.rand * 100).round})
  end

  def rand_date(from = 0.0, to = Time.now)
    Time.at(from + rand * (to.to_f - from.to_f))
  end
end