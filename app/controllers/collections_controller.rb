class CollectionsController < ApplicationController
  include DocumentsHelper
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  def index
    collection_scope = Document.includes(:payments)
    .cargo.not_cancelled
    .where(payments: {payment_type: "collect"})
    .where.not(status1: 2)
    # collection_scope = collection_scope.search(params[:filter]) if params[:filter]
    @collection = smart_listing_create(
      :collections,
      collection_scope,
      partial: "collections/list"
    )
  end

end
