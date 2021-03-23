require "test_helper"

class TestHelperTest < Minitest::Test
  include Stagery::TestHelper

  def setup
    Stagery.instance_variable_set(:@_stage, nil)
  end

  def test_with_stagery_stage_change_stage_for_the_given_block
    ENV['STAGERY_STAGE'] = 'staging'

    with_stagery_stage('production') do
      assert_equal 'production', Stagery.stage
    end

    assert_equal 'staging', Stagery.stage
  end
end
