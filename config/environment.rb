# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
require 'trimmer'

# Initialize the Rails application.
Rails.application.initialize!
class ActiveRecord::Base
  include Trimmer
end