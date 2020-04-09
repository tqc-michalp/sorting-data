# frozen_string_literal: true

# common interfaces for processing data step by step
class Sorting::Interface
  # NOTE: We can omit to call attr_accessor in children classes
  # by delegate methods. For example, we can use RoR:
  # require 'active_support/core_ext/module/delegation'
  # and write code:
  # delegate :request, :errors, :outcome, to: :supervisor

  attr_accessor :supervisor
  def initialize(supervisor)
    @supervisor = supervisor
  end

  def execute
    raise NotImplementedError, 'subclass did not define #execute'
  end
end
