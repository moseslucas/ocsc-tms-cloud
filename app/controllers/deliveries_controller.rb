class DeliveriesController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper
  before_action :set_filters, only: :master_index

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

    if @f_commit && @f_commit == "FILTER"
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

    elsif @f_commit && @f_commit == "RESET"
      redirect_to "/master_deliveries"
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

  private
  def set_filters
    @f_daterange = params[:daterange] || "#{Date.today.beginning_of_year.strftime("%m/%d/%Y")} - #{Date.today.strftime("%m/%d/%Y")}"
    @f_commit = params[:commit]
    @f_source = params[:source]
    @f_destination = params[:destination]
  end
end
