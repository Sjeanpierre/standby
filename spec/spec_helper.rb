require 'rubygems'
require 'bundler/setup'

require 'slavery'

# Activate Slavery
ActiveRecord::Base.send(:include, Slavery)

# Prepare databases
class User < ActiveRecord::Base
end

Slavery.env = 'test'

ActiveRecord::Base.configurations = {
  'test' =>        { adapter: 'sqlite3', database: 'test_db' },
  'test_slave' =>  { adapter: 'sqlite3', database: 'test_slave_db' }
}

# # Create two records on master
# ActiveRecord::Base.establish_connection(:test)
# ActiveRecord::Base.connection.create_table :users, force: true
# User.create
# User.create

# # Create one record on slave, emulating replication delay
# ActiveRecord::Base.establish_connection(:test_slave)
# ActiveRecord::Base.connection.create_table :users, force: true
# User.create

ActiveRecord::Base.establish_connection(:test)
