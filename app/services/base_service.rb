# frozen_string_literal: true

class BaseService

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
