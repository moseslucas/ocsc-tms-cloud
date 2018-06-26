class CargosController < ApplicationController
  include DocumentsHelper
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper
  before_action :set_filters, only: :index

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
    if @f_status2 && @f_status2 != ""
      cargos_scope = cargos_scope.where( documents: { status2: params[:status2] } )
    end
    if @f_client_id && @f_client_id != ""
      cargos_scope = cargos_scope.where( client_id: @f_client_id )
    end
    if @f_cwb && @f_cwb != ""
      cargos_scope = cargos_scope.where( documents: {ref_id: @f_cwb} )
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

  def set_filters
    @f_status2 = params[:status2]
    @f_client_id = params[:client_id]
    @f_cwb = params[:cwb]
  end

end
