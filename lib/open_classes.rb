class Array
	def add_meta_to entity
        self.each do | hash |
            hash.each do |key, value| 
            	entity.add_meta key, value
            end
        end
	end
end		

class String
	def add_meta_to entity
		entity.add_meta self, self
	end
end
