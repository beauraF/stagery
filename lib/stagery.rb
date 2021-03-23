# frozen_string_literal: true

require 'active_support/string_inquirer'
require_relative 'stagery/version'

module Stagery
  def self.stage
    @_stage ||= ActiveSupport::StringInquirer.new(ENV["STAGERY_STAGE"] || "development")
  end

  def self.stage=(stage)
    @_stage = ActiveSupport::StringInquirer.new(stage)
  end
end
