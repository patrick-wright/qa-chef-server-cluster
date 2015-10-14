#
# Cookbook Name:: build
# Recipe:: standalone_prepare_machine_configs
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

delivery_stage_db do
  action :download
end

path = node['delivery']['workspace']['repo']
qa_path = "#{path}/deps/qa-chef-server-cluster"

ruby_block 'write-machine-configs' do
  block do
    Dir.chdir qa_path

    identifier = node['chef-server-acceptance']['identifier']

    standalone_state = ::Chef.node.run_state['delivery']['stage']['data'][identifier]['standalone']
    IO.write('nodes/default-standalone.json', standalone_state.to_json)
  end
end