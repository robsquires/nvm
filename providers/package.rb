#
# Cookbook Name:: nvm
# Provider:: nvm_package
#
# Copyright 2013, Rob Squires
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

action :create do
	version = new_resource.version
	package = new_resource.package
	bash "Installing package #{package} for node environment: #{version}" do
		code <<-EOH
			#{node['nvm']['source']}
			nvm use #{version}
			npm install -g #{package}
		EOH
	end
	new_resource.updated_by_last_action(true)
end