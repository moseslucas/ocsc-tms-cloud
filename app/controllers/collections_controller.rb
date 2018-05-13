class CollectionsController < ApplicationController
  include DocumentsHelper
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  def index
    @status1 = 1
    collection_scope = Document.joins(:payments, :client, :destination)
    .cargo.not_cancelled
    .where(payments: {payment_type: "collect"})
    collection_scope = collection_scope.where(status1: params[:closed_payments] === "2" ? 2 : 1)
    collection_scope = collection_scope.cargo_search(params[:filter]) if params[:filter]
    @collection = smart_listing_create(
      :collections,
      collection_scope,
      partial: "collections/list",
      default_sort: {trans_date: "desc"}
    )
  end
end
