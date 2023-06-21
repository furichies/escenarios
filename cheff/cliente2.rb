require 'socket'

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                Socket.gethostname
ssl_verify_mode :verify_none
client_key               "/etc/chef/agente2.pem"
chef_server_url          "https://chef-server/organizations/curso1265"
cookbook_path            ["/vagrant/cookbooks"]
