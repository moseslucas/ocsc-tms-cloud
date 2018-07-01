namespace :create_branch_users do
  desc "Will create branch users"

  task start: :environment do
    User.create(id: "USR18-0000001", name: "pasay", password: "ocscpasay", user_type: "branch")
    User.create(id: "USR18-0000002", name: "mirasol", password: "ocscmirasol", user_type: "branch")
    User.create(id: "USR18-0000003", name: "virac", password: "ocscvirac", user_type: "branch")
    User.create(id: "USR18-0000004", name: "sanandres", password: "ocscsanandres", user_type: "branch")
  end

end
