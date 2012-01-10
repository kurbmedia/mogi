class Commit
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :hash,      :type => String
  field :changeset, :type => Array, :default => []
  
end
