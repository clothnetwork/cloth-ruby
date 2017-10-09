module Cloth
  class Item
    def initialize(id, data)
      @id = id
      @data = data
      @user = data["user_id"] if @data && data["user_id"]
    end

    attr_reader :data
    attr_reader :id
    attr_reader :user

    def recommend
      Cloth.client.post("/api/items/recommend", { body: { item: { id: id, data: data } } })
    end

    def unrecommend
      Cloth.client.post("/api/items/unrecommend", { body: { item: { id: id, data: data } } })
    end

    def recommendations
      resp = Cloth.client.get("/api/items/#{id}/recommendations")
      if resp['recommendations']
        resp['recommendations']
      else
        resp
      end
    end

    class << self
      def recommend(id, data = nil)
        Item.new(id, data).recommend
      end

      def unrecommend(id, data = nil)
        Item.new(id, data).unrecommend
      end

      def recommendations(id, data = nil)
        Item.new(id, data).recommendations
      end
    end
  end
end
