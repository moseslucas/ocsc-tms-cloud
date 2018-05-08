class ClientsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper
  before_action :set_params, only: [:create, :update]
  before_action :find_record, only: [:edit, :update, :destroy]

  def index
    client_scope = Client.active.from_branch("master")
    client_scope = client_scope.search(params[:filter]) if params[:filter]
    @client = smart_listing_create(
      :clients,
      client_scope,
      partial: "clients/list",
      default_sort: {updated_at: "desc"}
    )
  end

  def create
    @client = Client.new @params
    @client.id = generate_id("MSTR-CLNT",Client)
		if @client.save 
			redirect_to clients_path, notice: "Client was successfully created"
		else
			render :new
		end
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def update
    if @client.update @params
      redirect_to clients_path, notice: "Client was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @client.update_attribute :status, 0
    redirect_to clients_path, notice: "Client was successfully deleted"
  end

  private

  def set_params
    @params = params.require(:client).permit(
      :name,
      :description,
      :contact,
      :email,
      :address,
      :credit_limit,
      :discount_id
    )
  end

  def find_record
    @client = Client.find params[:id]
  end

end
