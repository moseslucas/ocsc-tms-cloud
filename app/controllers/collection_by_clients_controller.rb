class CollectionByClientsController < ApplicationController
  include DocumentsHelper
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  def index
    client_scope = Client.active
    client_scope = client_scope.search(params[:filter]) if params[:filter]
    @client = smart_listing_create(
      :clients,
      client_scope,
      partial: "collection_by_clients/list",
      default_sort: {name: "asc"}
    )
  end
end
