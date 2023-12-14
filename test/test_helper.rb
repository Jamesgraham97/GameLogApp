# test/test_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'devise'

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors, with: :threads)
    fixtures :all
    include Devise::Test::IntegrationHelpers
  end
end
