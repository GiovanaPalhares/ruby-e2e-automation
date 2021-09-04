require 'mongo'

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class Mongodb

    def remove_user(email)
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        users = client[:users]
        users.delete_many({email: email})
    end

    def remove_equipo(name, user_id)
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        equipos = client[:equipos]
        obj_id = BSON::ObjectId.from_string(user_id) #pega o user_id e passa para object_id que é o formato que o banco aceita
        equipos.delete_many({name: name, user: obj_id}) 
    end

    def cria_equipo_id 
        return BSON::ObjectId.new
    end

end

