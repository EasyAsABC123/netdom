#
# Author:: Justin Schuhmann (<jmschu02@gmail.com>)
# Cookbook Name:: NETDOM
# Resource:: join
#
# Copyright:: 2014
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

actions :remove

attribute :domain, :kind_of => String, :name_attribute => true
attribute :domain_admin, :kind_of => String
attribute :domain_admin_password, :kind_of => String

attr_accessor :exists

def initialize(*args)
  super
  @action = :remove
end
