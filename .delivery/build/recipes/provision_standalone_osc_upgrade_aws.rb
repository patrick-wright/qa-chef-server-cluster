#
# Cookbook Name:: build
# Recipe:: provision_standalone_osc_upgrade_aws
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

node.override['chef-server-acceptance']['identifier'] = 'standalone-osc-upgrade'
node.override['chef-server-acceptance']['upgrade'] = true
node.override['chef_server_upgrade_from_flavor'] = 'open_source_chef'
node.override['chef_server_upgrade_from_channel'] = 'stable'
node.override['chef_server_upgrade_from_version'] = '11.1.7'

include_recipe 'build::provision_general_prep'

include_recipe 'build::provision_standalone'

include_recipe 'build::provision_standalone_generate_test_data_and_upgrade'

include_recipe 'build::provision_standalone_stage_db'
