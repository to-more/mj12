class LinkedinImporter
  include Mongoid::Document

  field :idProfile, type: String
  field :url, type: String
  field :profile, type: String
end
