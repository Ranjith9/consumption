require 'chef/knife'
require "#{File.dirname(__FILE__)}/base/dengine_azure_sdk_graph_base"


module Engine
  class DengineAzureSdkGraphList < Chef::Knife

    include DengineAzureSdkGraphBase

    banner "knife dengine azure sdk graph list (options)"

      def run
        promise = graph_client.users.list(filter = nil, custom_headers = nil)
        puts promise
      end

  end
end

