class Conf
  $configuration = AppConfig.all
  # 动态产生Conf.xxx调用
  def self.method_missing(conf_key)
    record = $configuration.detect{|c|c.key == conf_key.to_s}
    return nil if record.blank?
    self.type_cast(record.value, record.data_type.to_sym)
  end
  
  def self.type_cast(value, type)
    return nil if value.nil? || value == 'nil'
    adapter = ActiveRecord::ConnectionAdapters::Column
    case type
      when :string    then value
      when :integer   then value.to_i rescue value ? 1 : 0
      when :float     then value.to_f
      when :datetime  then adapter.string_to_time(value)
      when :time      then adapter.string_to_dummy_time(value)
      when :date      then adapter.string_to_date(value)
      when :boolean   then adapter.value_to_boolean(value)
      when :array     then value[1..-2].split(',')
      else value
    end
  end
  
  def self.reload
    $configuration = AppConfig.all
  end
end
