class CargosController < ApplicationController
  include DocumentsHelper
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  def index 
    # byebug
    cargos_scope = Document.includes(
      :client,
      :destination,
      :calculation
    )
    .cargo.has_cargo_calculation
    .not_cancelled
    .from_exact_branch(session[:branch])
    cargos_scope = cargos_scope.cargo_search(params[:filter]) if params[:filter]
    if params[:status2] && params[:status2] != "ALL"
      cargos_scope = cargos_scope.where( documents: { status2: params[:status2] } )
    end
    @cargos = smart_listing_create(
      :cargos,
      cargos_scope,
      partial: "cargos/list",
      default_sort: {trans_date: "desc"}
    )
  end

  def show
    @doc = Document.find_by id: params[:id]
  end

  private

end
