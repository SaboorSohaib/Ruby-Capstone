class Item
    def initialize(publish_date, archived)
        @id = Random.rand(1..100)
        @publish_date = publish_date
        @archived = archived
    end
    
end