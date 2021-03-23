# frozen_string_literal: true

module Stagery
  module TestHelper
    def with_stagery_stage(stage)
      previous_stagery_stage = Stagery.stage
      Stagery.stage = stage
      yield
    ensure
      Stagery.stage = previous_stagery_stage
    end
  end
end
