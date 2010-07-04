class AppConfig < ActiveRecord::Base
  #acts_as_list :scope => :group
  
  validates_presence_of :key, :name, :default_value, :data_type
  validates_uniqueness_of :key
  
  after_save :reload_config
  def reload_config
    Conf.reload
  end
end
