class Item < ApplicationRecord
	before_create :check_mask
         
	def check_mask
    if self.detailed_review.present?
    	numbers = self.detailed_review.scan(/([^A-Z|^"]{6,})/i).collect{|x| x[0].strip }
  	  email = self.detailed_review.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
  	  numbers << email
      item_desc = self.detailed_review
      puts numbers
      numbers.flatten.each do |i|
       new_str = ""
       new_str = i.length.times.collect{"*"}.join(' ')
       item_desc = item_desc.gsub(i,new_str)
      end
      self.detailed_review = item_desc
    end
	end
end
