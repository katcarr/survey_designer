class Survey < ActiveRecord::Base

  before_save(:upcase_title)

  define_method(:upcase_title) do
    names = (name().split(" "))

    names.each() do |n|
      n= n.capitalize!()
    end

    names = names.join(" ")
    self.name = names
  end
end
