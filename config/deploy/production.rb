 server "", user: "deploy", roles: %w{app web}

 set :branch, ENV['BRANCH'] || 'master'