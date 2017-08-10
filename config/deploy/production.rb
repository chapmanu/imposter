 server "impv-mkt-wb01.chapman.edu", user: "deploy", roles: %w{app web}

 set :branch, ENV['branch'] ||  "master"