require 'mongo'
require 'pry'

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class Mongodb
    attr_accessor :client, :users, :equipos

    def remove_user(email)
        client = Mongo::Client.new(CONFIG["mongo"])
        users = client[:users]
        users.delete_many({email: email})
    end

    def get_user(email)
        client = Mongo::Client.new(CONFIG["mongo"])
        users = client[:users]
        user = users.find({email: email}).first
        return user[:_id]
    end

    def remove_equipo(name, email)
        user_id = get_user(email)
        client = Mongo::Client.new(CONFIG["mongo"])
        equipos = client[:equipos]
        equipos.delete_many({name: name, user: user_id})
    end

    def drop_table
        #binding.pry
        client = Mongo::Client.new(CONFIG["mongo"])
        client.database.drop
    end
    
    def insert_users(docs)
        client = Mongo::Client.new(CONFIG["mongo"])
        users = client[:users]
        users.insert_many(docs)
    end

end

