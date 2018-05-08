class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :active, -> {where(status: 1)}
  scope :deleted, -> {where(status: 0)}


  scope :not_cancelled, -> {where.not(status1: 0)}
  scope :cancelled, -> {where(status1: 0)}
  scope :consigned, -> {where(status1: 1)}
  scope :fully_paid, -> {where(status1: 2)}

  scope :for_delivery, -> {where(status2: 0)}
  scope :in_transit, -> {where(status2: 1)}
  scope :released, -> {where(status2: 2)}

  scope :has_cargo_calculation, -> {where(calculations: {calculation_type: "cargo"})}
  scope :has_parcel_calculation, -> {where(calculations: {calculation_type: "parcel"})}

  scope :from_branch, -> (branch) { where("'#{branch}' = ANY (branch)") }
  scope :from_exact_branch, -> (branch) { where(branch: ["#{branch}"]) }
  scope :from_exact_branches, -> (branches) { where branch: branches }
end
