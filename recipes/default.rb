#
# Cookbook:: etckeeper
# Recipe:: default
#
# Copyright:: 2013, Alexander Saharchuk.
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

include_recipe 'git'

package 'etckeeper' do
  action :install
end

# if a .bzr directory exists, etckeeper will use bzr, ignoring the
# configured vcs:
directory '/etc/.bzr' do
  action :delete
  only_if { node['etckeeper']['config_file']['VCS'] == 'git' }
  recursive true
end

include_recipe 'etckeeper::config'
