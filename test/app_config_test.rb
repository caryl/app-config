require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class SimpleConfigTest < Test::Unit::TestCase
  def setup
    AppConfig.create(
      [{:key=>'int', :name=>'整数', :data_type => 'integer', :value=> '123', :default_value => '100' },
      {:key=>'float', :name=>'小数', :data_type => 'float', :value=> '234', :default_value => '200.0' },
      {:key=>'bool', :name=>'布尔', :data_type => 'boolean', :value=> 'true', :default_value => 'false' },
      {:key=>'string', :name=>'字符串', :data_type => 'string', :value=> 'abc', :default_value => 'aaa' },
      {:key=>'date', :name=>'日期', :data_type => 'date', :value=> '2010-01-02', :default_value => '2010-01-01' },
      {:key=>'array', :name=>'数组', :data_type => 'array', :value=> '[a,b,c]', :default_value => '[1,2,3]' }]
    )
  end
  
  def test_configuation
    assert_equal Conf.int, 123
    assert_equal Conf.float, 234.0
    assert_equal Conf.bool, true
    assert_equal Conf.string, 'abc'
    assert_equal Conf.int, 123
    assert_equal Conf.date, Date.new(2010,1,2)
    assert_equal Conf.array, ['a','b','c']
  end
  
end
