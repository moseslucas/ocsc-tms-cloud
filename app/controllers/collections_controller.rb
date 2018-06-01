class CollectionsController < ApplicationController
  include DocumentsHelper
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  def index
    collection_scope = Document.includes(:client, :destination, :calculation)
    .cargo
    .not_cancelled
    .has_cargo_calculation
    .last(10)
    @collection = collection_scope.map do |c|
       {
        refId: c.ref_id,
        clientName: c.client.name,
        transDate: c.trans_date,
        branch: c.branch[0].titleize,
        destination: c.destination.name,
        status1: if c.status1 == 1  then "OPEN" elsif c.status1 == 2 then "CLOSED" end,
        totalAmount: c.total_amount
       }
    end
    # collection_scope = collection_scope.where(status1: params[:closed_payments] === "2" ? 2 : 1)
    # collection_scope = collection_scope.cargo_search(params[:filter]) if params[:filter]
    # @collection = smart_listing_create(
    #   :collections,
    #   collection_scope,
    #   partial: "collections/list",
    #   default_sort: {trans_date: "desc"}
    # )
  end
end
