module LinkedinImportersHelper
	include LinksHelper

	define_method (:get_entity_from ) do | title = nil |

		entity = Entity.find_my_title title

	    if entity.nil?
	      entity = Entity.new(:title => title)
	      save_entity entity
	    else
	      entity.update(:title => title)
	    end

	    return entity

	end

	define_method (:prepare_to_import) do | profile = nil |

		title = ""

		if profile
			title = profile.name if profile.name

			title = profile.title unless title
			
			title = "Undefined" unless title							
		end		

		entity = get_entity_from title

		return entity
	end

	define_method (:add_meta_to_entity) do | entity = nil, profile = nil |


		begin
			profile.organizations.add_meta_to entity if profile.organizations
		rescue Exception => e
			puts e.message
		end
		begin			
			profile.last_name.add_meta_to entity if profile.last_name
		rescue Exception => e
			puts e.message
		end		
		begin	
			profile.industry.add_meta_to entity if profile.industry
		rescue Exception => e
			puts e.message
		end
		begin	
			profile.location.add_meta_to entity if profile.location
		rescue Exception => e
			puts e.message
		end
		begin	
			profile.current_companies.add_meta_to entity if profile.current_companies
		rescue Exception => e
			puts e.message
		end
		begin
			profile.past_companies.add_meta_to entity if profile.past_companies
		rescue Exception => e
			puts e.message
		end
		begin
			profile.education.add_meta_to entity if profile.education
		rescue Exception => e
			puts e.message
		end

	end

	define_method (:add_links_to_entity) do | entity = nil, recomended_entity = nil |


		begin
			add_relation entity.id, recomended_entity.id
		rescue Exception => e
			puts e.message
		end
		
	end

	define_method :save_entity do | entity = nil |
		
		entity.save
	end

end
