# frozen_string_literal: true

class NumberArraysController < ApplicationController
  protect_from_forgery with: :null_session

  def new; end

  def process_array
    json_data = JSON.parse(request.body.read)
    numbers = json_data['numbers']

    if numbers.nil? || numbers.empty?
      render json: { error: 'Array is empty' }, status: :unprocessable_entity
      return
    end

    numbers = func2 numbers

    render json: { original_array: json_data['numbers'], modified_array: numbers }
  end

  def func(array)
    array = array.select(&:positive?)

    return unless array.any?

    array.min
  end

  def func2(numbers)
    min_number = func(numbers)

    if numbers.any?(&:negative?)
      negative_index = numbers.index(&:negative?)
      numbers[negative_index] = min_number
    else
      numbers.unshift(min_number)
    end
    numbers
  end
end
