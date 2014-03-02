require 'singleton'

class Problem

  include Singleton

  def self.solution
    instance.solve
  end

end

