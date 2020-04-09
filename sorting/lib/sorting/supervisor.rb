# frozen_string_literal: true

class Sorting::Supervisor
  attr_reader :request
  attr_accessor :errors, :outcome
  def initialize(request)
    @request = request
    @errors = []
  end

  def execute
    # NOTE: To unify incoming data from different sources/ MIME types,
    # we can easily inject parser pattern: %w[Payload Parser].each do |step|
    %w[Payload].each do |step|
      self.class.const_get("Sorting::#{step}::#{request[:type]}").new(self).execute # NOTE: In RoR it is easier to use safe_constantize.
      return errors if errors.any?
    end
    self.class.const_get("Sorting::Scope::#{request[:scope]}").new(self).execute
    return errors if errors.any?

    puts decorate_outcome
  end

  private

  def decorate_outcome
    outcome.map { |i| "#{i} is available\n" }.join
  end
end
