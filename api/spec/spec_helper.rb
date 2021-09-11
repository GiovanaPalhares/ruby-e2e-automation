## ao invés de passar em cada arquivo spec a rota das APIs que serão utilizadas, coloca todos os caminhos aqui pois esse arquivo roda antes de todos os specs, então já pega a rota automaticamente

require_relative 'routes/post_equipos'
require_relative 'routes/sessions'
require_relative 'libs/mongo'
require_relative 'helpers'
require_relative 'routes/signup_sessions'
require_relative 'routes/get_equipos_session.rb'
require_relative 'routes/delete_equipo'
require_relative 'routes/booking_equipo'

require "digest/md5"

def to_md5(pass)
  return Digest::MD5.hexdigest(pass)
end

RSpec.configure do |config|
  
  config.expect_with :rspec do |expectations|
    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  
  config.mock_with :rspec do |mocks|
    
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do 
    users = [
      { name: "joao", email: "joao@hotmail.com", password: to_md5("123456") },
      { name: "maria1", email: "maria1@hotmail.com", password: to_md5("123456") },
      { name: "Giovana", email: "giovana@hotmail.com", password: to_md5("123456") },
      { name: "Giovana Silva", email: "giovana10@hotmail.com", password: to_md5("123456") }
    ]

    Mongodb.new.drop_table
    Mongodb.new.insert_users(users)
  end


end
