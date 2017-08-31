#
# This deploy script is for a VirtualBox VM running on your local machine.
# See the dev Ansible script for more info.
#
# USAGE:
#   vboxmanage startvm redhat7 --type headless
#   cap vm deploy
#
# Roles are where the various servers live
server "localhost", user: "deploy", roles: %w{web}, port: 2222

# The git branch for staging
def current_git_branch
  branch = `git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/^refs\/heads\//, '')
  puts "Deploying branch #{branch}"
  branch
end

# Set the deploy branch to the current branch
set :branch, current_git_branch
