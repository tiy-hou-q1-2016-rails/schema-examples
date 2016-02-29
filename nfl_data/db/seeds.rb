# sql_query = <<-SQLQUERY
# COPY nfl_suspensions ("name","team","games","category","description","year","source") FROM '#{Rails.root}/nfl_suspensions.csv' DELIMITER ',' CSV HEADER;
# SQLQUERY
#
# ActiveRecord::Base.connection.execute(sql_query)

NflSuspension.delete_all

require 'csv'
CSV.foreach("nfl_suspensions.csv", headers: true) do |row|
  # values = row.to_hash
  # record = NflSuspension.new name: values["name"], year: values["year"], category: values["category"]
  # record.save
  NflSuspension.create row.to_hash
end
