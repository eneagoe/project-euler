require "singleton"

# Generic base class for solvers
class Problem
  include Singleton

  def self.solution
    instance.solve
  end
end
