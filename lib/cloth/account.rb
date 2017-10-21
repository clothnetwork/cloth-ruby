module Cloth
  class Account
    class << self
      def usage
        Cloth.client.get('/api/usage')
      end
    end
  end
end
