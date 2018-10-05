class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def cost_conversion
    return self.cost * 1.0 / 100
  end
end
