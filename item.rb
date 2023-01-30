class Item
    def initialize(publish_date, archived: false)
        @id = Random.rand(1..100)
        @publish_date = publish_date
        @archived = archived
    end

    def move_to_archive
        can_be_archived? || @archived
    end

    private
    def can_be_archived?
        @publish_date > 10
    end
end