ActiveRecord::Schema.define(:version => 0) do
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
