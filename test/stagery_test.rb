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

  def test_fallback_to_rails_env_if_stagery_stage_is_blank_and_rails_defined
    ENV['STAGERY_STAGE'] = nil

    with_rails_env_production do
      assert_equal "production", Stagery.stage
    end
  end

  def test_stage_can_be_set_at_runetime
    ENV['STAGERY_STAGE'] = 'staging'
    Stagery.stage = 'production'

    assert_equal "production", Stagery.stage
  end

  private

  def with_rails_env_production
    Object.const_set("Rails", eval(<<~RUBY))
      Module.new do
        def self.env
          "production"
        end
      end
    RUBY

    yield
  ensure
    Object.send(:remove_const, "Rails")
  end
end
