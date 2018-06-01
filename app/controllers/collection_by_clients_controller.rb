class CollectionByClientsController < ApplicationController
  include DocumentsHelper
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  def index
    collection_scope = Client.active
    @collection = smart_listing_create(
      :collections,
      collection_scope,
      partial: "collection_by_clients/list",
      default_sort: {name: "asc"}
    )
  end
end
