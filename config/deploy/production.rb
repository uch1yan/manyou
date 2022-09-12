server '54.64.95.171', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/uchi/.ssh/id_rsa'