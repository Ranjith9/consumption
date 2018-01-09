require 'chef/knife'
require 'azure_mgmt_graph'

module Engine
  module DengineAzureSdkGraphBase

      include Azure::Graph::Mgmt::V1_6
      include Azure::Graph::Mgmt::V1_6::Models

      def self.included(includer)
      includer.class_eval do

        def graph_client

          @graph_client ||= begin
            token_provider = MsRestAzure::ApplicationTokenProvider.new(Chef::Config[:knife][:azure_tenant_id], Chef::Config[:knife][:azure_client_id], Chef::Config[:knife][:azure_client_secret])
            credentials = MsRest::TokenCredentials.new(token_provider)
            graph_client = GraphRbacManagementClient.new(credentials)
          end
        @graph_client.tenant_id = Chef::Config[:knife][:azure_tenant_id]
        @graph_client
        end
        end
      end
    end
  end

