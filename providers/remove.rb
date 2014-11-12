#
# Author:: Kendrick Martin (kendrick.martin@webtrends.com)
# Contributor:: Adam Wayne (awayne@waynedigital.com)
# Cookbook Name:: iis
# Provider:: app
#
# Copyright:: 2011, Webtrends Inc.
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

require 'chef/mixin/shell_out'

include Chef::Mixin::ShellOut
include Windows::Helper

action :remove do
  unless @current_resource.exists
    cmd = "netdom remove #{node['machinename']}"
    cmd << " /domain:#{@new_resource.domain}" if @new_resource.domain
    cmd << " /userd:#{@new_resource.domain_admin}" if @new_resource.domain_admin
    cmd << " /passwordd:#{@new_resource.domain_admin_password}" if @new_resource.domain_admin_password
    Chef::Log.debug(cmd)
    shell_out!(cmd)
    @new_resource.updated_by_last_action(true)
    Chef::Log.info("Computer removed from domain after reboot.")
  else
    Chef::Log.debug("#{@new_resource} is not on the domain specified.")
  end
end

def load_current_resource
  @current_resource = Chef::Resource::NetdomRemove.new(@new_resource.domain)
  @current_resource.domain_admin(@new_resource.domain_admin)
  @current_resource.domain_admin_password(@new_resource.domain_admin_password)
  domain_name = node['domain']
  result = domain_name != nil && domain_name.downcase != @new_resource.domain.downcase
  if result
    @current_resource.exists = true
  else
    @current_resource.exists = false
  end
end