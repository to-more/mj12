module LinksHelper

	def add_relation ida, idb

	    @link = Link.find_my_link( ida, idb)

	    if @link.nil? 
	      @link = Link.new
	      @link.ent_a_id = ida
	      @link.ent_b_id = idb
	      @link.save
	    else
	      @link.update( :ent_a_id => ida, :ent_b_id => idb)
	    end		
	end

end
