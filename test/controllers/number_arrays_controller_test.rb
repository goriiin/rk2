# frozen_string_literal: true

require 'test_helper'

class NumberArraysControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get number_arrays_new_url
    assert_response :success
  end
end
