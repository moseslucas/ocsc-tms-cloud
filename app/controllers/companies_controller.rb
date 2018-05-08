class CompaniesController < ApplicationController
  before_action :get_record, only: [:index]

  def index 
    render json: @companies
  end

  private
  def get_record
    @companies = Company.all
  end
end
