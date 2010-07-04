class CreateAppConfigs < ActiveRecord::Migration
  def self.up
    create_table :app_configs do |t|
      t.string :group
      t.integer :position
      t.string :key
      t.string :name
      t.string :data_type
      t.string :value
      t.string :default_value
      t.string :tips

      t.timestamps
    end
  end

  def self.down
    drop_table :app_configs
  end
end
