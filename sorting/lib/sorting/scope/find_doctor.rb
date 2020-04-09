# frozen_string_literal: true

class Sorting::Scope::FindDoctor < Sorting::Interface
  attr_accessor :header_index, :rows
  def execute
    identify_item_index
    return if supervisor.errors.any?

    prepare_outcome
    retrive_items
  end

  private

  def identify_item_index
    self.header_index = supervisor.outcome.first.index(supervisor.request[:day])
    supervisor.errors.push('The data key was not found.') if header_index.nil?
  end

  def prepare_outcome
    supervisor.outcome.shift
    self.rows = supervisor.outcome
    supervisor.outcome = []
  end

  def retrive_items
    rows.each do |row|
      supervisor.outcome.push(row.first) if row[header_index] == 'ON'
    end
  end
end
