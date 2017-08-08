 server "localhost:5555", user: "deploy", roles: %w{app web}

 set :branch, ENV['BRANCH'] || 'master'