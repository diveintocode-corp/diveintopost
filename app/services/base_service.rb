# frozen_string_literal: true

module Allowable
  def can?(*args)
    Ability.allowed?(*args)
  end
end


class BaseService
  include Allowable

  attr_accessor :errors

  def initialize(h = {})
    @attr = h.dup
    errors = []
    h.keys.each do |prop|
      self.instance_eval %Q{
        def #{prop.to_s}
          @attr["#{prop}".intern] || ""
        end
        def #{prop.to_s}=(arg)
          @attr["#{prop}".intern]= arg
       end
      }
    end
  end

end
