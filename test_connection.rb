require 'pg'

begin
  conn = PG.connect(
    host: 'db.tjpbplrqitiwpeaewxgu.supabase.co',
    port: 5432,
    dbname: 'postgres',
    user: 'postgres',
    password: 'c8DbvH48FGD4LC2b'
  )
  puts "Successfully connected to database!"
  puts "Tables: #{conn.exec('SELECT table_name FROM information_schema.tables WHERE table_schema = \'public\'').map { |row| row['table_name'] }}"
rescue PG::Error => e
  puts "Error connecting to database: #{e.message}"
ensure
  conn&.close
end 