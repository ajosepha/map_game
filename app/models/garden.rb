class Garden < ActiveRecord::Base
  attr_accessible :name, :address, :size, :nyc_neighborhood, :boro
  belongs_to :neighborhood

  def self.make_gardens
    

  end

end
