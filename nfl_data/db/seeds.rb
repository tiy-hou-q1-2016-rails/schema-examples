sql_query = <<-SQLQUERY
COPY nfl_suspensions ("name","team","games","category","description","year","source") FROM '#{Rails.root}/nfl_suspensions.csv' DELIMITER ',' CSV HEADER;
SQLQUERY

ActiveRecord::Base.connection.execute(sql_query)
