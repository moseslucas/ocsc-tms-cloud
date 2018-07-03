class DeliveriesController < ApplicationController
  include DocumentsHelper
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper
  before_action :auth_user_type, except: [:master_index, :master_show, :master_set_delivery_description]
  before_action :set_filters, only: :master_index
  before_action :set_delivery_description, only: :master_set_delivery_description

  def index 
    deliveries_scope = Document.from_exact_branch(session[:branch]).includes(
      :source,
      :destination,
      :vehicles,
      :employees
    ).delivery.not_cancelled
    deliveries_scope = deliveries_scope.delivery_search(params[:filter]) if params[:filter]
    @deliveries = smart_listing_create(
      :deliveries,
      deliveries_scope,
      partial: "deliveries/list",
      default_sort: {trans_date: "desc"}
    )
  end

  def master_index
    deliveries_scope = Document.delivery.not_cancelled.includes(
      :source,
      :destination,
      :vehicles,
      :employees
    )

    @select_source = deliveries_scope.distinct.pluck(:source_id).map do |loc|
      {id: loc, name: Location.find(loc).name }
    end

    @select_destination = deliveries_scope.distinct.pluck(:destination_id).map do |loc|
      {id: loc, name: Location.find(loc).name }
    end


    # deliveries_scope = deliveries_scope.delivery_search(params[:filter]) if params[:filter]

    if @f_daterange && @f_daterange != ""
      range_start = @f_daterange[0..9]
      range_end = @f_daterange[13..22]
      deliveries_scope = deliveries_scope.where("documents.trans_date >= ? AND documents.trans_date <= ?", range_start, range_end)
    end

    if @f_source && @f_source != ""
      deliveries_scope = deliveries_scope.where(documents: {source_id: @f_source})
    end

    if @f_destination && @f_destination != ""
      deliveries_scope = deliveries_scope.where(documents: {destination_id: @f_destination})
    end

    @master_deliveries = smart_listing_create(
      :master_deliveries,
      deliveries_scope,
      partial: "deliveries/master_list",
      default_sort: {trans_date: "desc"}
    )
  end

  def show
    @doc = Document.find_by id: params[:id]
  end

  def master_show
    @doc = Document.find_by id: params[:id]
    @items = @doc.document_details.map do |item|
      {
        ref_id: item.document_shipping.ref_id,
        shipper: item.document_shipping.shipper,
        consignee: item.document_shipping.client.name,
        qty: item.document_shipping.document_details.sum(:qty),
        description: item.document_shipping.document_details.first.description,
        destination: item.document_shipping.destination.name,
        amount: item.document_shipping.total_amount
      }
    end
  end

  def master_set_delivery_description
    if @params[:id]
      doc = Document.find @params[:id]
      doc.description = @params[:description]
      if doc.save
        render json: {status: 200}
      else
        render json: {status: 500}
      end
    else
      redirect_to "/master_deliveries"
    end
  end

  private
  def set_filters
    @f_daterange = params[:daterange] || "#{Date.today.beginning_of_year.strftime("%m/%d/%Y")} - #{Date.today.strftime("%m/%d/%Y")}"
    @f_commit = params[:commit]
    @f_source = params[:source]
    @f_destination = params[:destination]
  end

  def set_delivery_description
    @params = params.permit(:id, :description)
  end

end
