class Repository
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,      :type => String
  field :path_name, :type => String

  has_and_belongs_to_many :users
  embeds_many :commits
  
  before_create :generate_path_name
  after_create  :init_repo
  
  def path(full = true)
    base = File.join(Mogi.config.repository_path, self.path_name).strip
    (base << ".git") if full == true
    base
  end
  
  private
  
  def init_repo
    Grit::Repo.init_bare(path(true))
  end
  
  def generate_path_name
    self.path_name = self.name.to_slug.gsub("-", "_")
  end
  
end
