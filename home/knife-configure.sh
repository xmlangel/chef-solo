mkdir -p /root/.chef
echo "log_level                :info
log_location             STDOUT
node_name                ''
client_key               '/root/.chef/.pem'
validation_client_name   'chef-validator'
validation_key           '/etc/chef-server/chef-validator.pem'
chef_server_url          'https://f7513abe4cc5/organizations/myorg'
syntax_check_cache_path  '/root/.chef/syntax_check_cache'">/root/.chef/knife.rb
