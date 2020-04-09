# frozen_string_literal: true

require 'thor'

class Sorting::Cli < Thor
  desc 'find_doctor', "Takes a type(csv), path to source('./doctors.csv'), day name('Monday') and prints out the list of available doctors."

  option :type, required: true, type: :string
  option :path, required: true, type: :string
  option :day, required: true, type: :string

  def find_doctor
    return 'Invalid data source' unless validate_mime_type

    Sorting::Supervisor.new(request).execute
  end

  private

  def validate_mime_type
    %w[Csv Json].include?(request[:type])
  end

  def request
    {
      type: options[:type].capitalize,
      path: options[:path],
      scope: 'FindDoctor',
      day: options[:day].capitalize
    }
  end
end
