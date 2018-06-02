class CollectionByClientsController < ApplicationController
  include DocumentsHelper
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper
  helper_method :get_total_balance

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

  def cargos
    @client = Client.find params[:id]
    cargos = Document.includes(:client, :destination, :calculation)
    .cargo
    .not_cancelled
    .has_cargo_calculation
    .where({
      status1: 1,
      clients: {id: @client.id}
    })
    @cargos = cargos.map do |c|
      {
        id: c.id,
        cwb: "#{c.branch[0][0..2].upcase}-#{c.ref_id}",
        shipper: c.shipper,
        date: c.trans_date,
        destination: c.destination.name,
        status1: if c.status1 == 1 then "OPEN" elsif c.status1 == 2 then "CLOSED" end,
        total: c.total_amount,
        balance: 0,
        payment: "p"
      }
    end
  end

  def get_total_balance(client)
    total = client.documents
    .includes(:client, :destination, :calculation)
    .cargo.not_cancelled.has_cargo_calculation
    .where(status1: 1)
    .sum(:total_amount)

    payment = client.payments
    .includes(:document)
    .where.not(documents: {status1: 2})
    .where.not(payments: {status: 0})
    .sum(:amount)

    return (total - payment)
  end
end
