# frozen_string_literal: true

require 'csv'

class Sorting::Payload::Csv < Sorting::Interface
  def execute
    # NOTE: if we need to work with colossal CSV files
    # and our server has limited resources, we can
    # parse object to DB and then process it by a background worker.
    supervisor.outcome = CSV.read(supervisor.request[:path])
  rescue Errno::ENOENT => e
    supervisor.errors.push(e.message)
  end
end
