require "test_helper"

class StageryTest < Minitest::Test
  def setup
    Stagery.instance_variable_set(:@_stage, nil)
  end

  def test_has_a_version_number
    assert Stagery::VERSION
  end

  def test_use_stagery_stage_environment_variable
    ENV['STAGERY_STAGE'] = 'staging'

    assert_equal "staging", Stagery.stage
    assert Stagery.stage.staging?
  end

  def test_fallback_to_development_if_stagery_stage_is_blank
    ENV['STAGERY_STAGE'] = nil

    assert_equal "development", Stagery.stage
  end
end
