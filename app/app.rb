# frozen_string_literal: true

require 'rails-hyperstack'

class HyperComponent
  include Hyperstack::Component
end

class BasicComponent < HyperComponent
  render do
    P() { 'Look ma, no JS!' }
  end
end
