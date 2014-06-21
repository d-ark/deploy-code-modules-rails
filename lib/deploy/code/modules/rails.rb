require "deploy/code"
require "deploy/code/modules/rails/version"

module Deploy
  module Code
    module Modules
      module Rails
        # Your code goes here...
      end
    end
  end
end

Deploy::Code.within_capistrano do

  puts "Loading rails module."

  namespace :rails do
    task :fix_logs do
      run "mkdir -p #{shared_path}/log; true"
      run "chmod -R 777 #{shared_path}/log; true"
    end
  end

  after :deploy, 'rails:fix_logs'
end

