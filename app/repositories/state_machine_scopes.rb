module StateMachineScopes
  extend ActiveSupport::Concern

  included do
    state_machine.states.map do |state|

      scope state.name, -> { where(state: state.name.to_s) }
    end
  end
end
