require "active_record"

ActiveRecord::Base.establish_connection({
    database: "finatra_db",
    adpater: "sqlite3"
})
