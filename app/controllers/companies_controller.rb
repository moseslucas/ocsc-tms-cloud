class CompaniesController < ApplicationController
  before_action :get_record, only: [:index]
  before_action :auth_user_type

  def index 
    render json: @companies
  end

  private
  def get_record
    @companies = Company.all
  end
end
