#
# Author:: Lucas Hansen <lucash@opscode.com>
# Cookbook Name:: wordpress
# Provider:: wordpress_plugin
#
# Copyright:: 2013, Opscode, Inc <legal@opscode.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "php"
include_recipe "php::composer"

execute "Install wp-cli" do
  action :run
  cwd node['php']['composer']['dir']
  command "#{node['php']['composer']['bin']} require wp-cli/wp-cli=#{node['wordpress']['cli_version']}"
  not_if { File.exists?(node['wordpress']['bin']) }
end
