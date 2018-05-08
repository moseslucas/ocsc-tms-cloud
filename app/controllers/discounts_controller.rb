class DiscountsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper
  before_action :set_params, only: [:create, :update]
  before_action :find_record, only: [:edit, :update, :destroy]

  def index
    discount_scope = Discount.active
    discount_scope = discount_scope.search(params[:filter]) if params[:filter]
    @discount = smart_listing_create(
      :discounts,
      discount_scope,
      partial: "discounts/list",
      default_sort: {updated_at: "desc"}
    )
  end

  def create
    @discount = Discount.new @params
    @discount.id = generate_id("MSTR",Discount)
		if @discount.save 
			redirect_to discounts_path, notice: "Discount was successfully created"
		else
			render :new
		end
  end

  def new
    # testing
    ActionCable.server.broadcast "web_notifications_channel", {status: "OK"}
    @discount = Discount.new
  end

  def edit
  end

  def update
    if @discount.update @params
      redirect_to discounts_path, notice: "Discount was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @discount.update_attribute :status, 0
    redirect_to discounts_path, notice: "Discount was successfully deleted"
  end

  private

  def set_params
    @params = params[:discount].permit(
      :name,
      :description,
      :amount,
      :discount_type
    )
  end

  def find_record
    @discount = Discount.find params[:id]
  end

end
