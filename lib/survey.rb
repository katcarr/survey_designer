class Survey < ActiveRecord::Base

  has_many(:questions)
  before_save(:upcase_title)


  private


  define_method(:upcase_title) do
    names = (name().split(" "))
    names.each() do |n|
      n= n.capitalize!()
    end
    names = names.join(" ")
    self.name = names
  end


end
