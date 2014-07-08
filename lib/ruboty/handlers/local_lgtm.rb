module Ruboty
  module Handlers
    class LocalLgtm < Base
      on /build_lgtm ? (?<keyword>.+)/, name: "build", description: "build lgtm"

      def build(message)
        p message
        #if url = search(message[:keyword])
        # message.reply(url)
        #end
      end

      private

      def search(query)
        Ruboty::GoogleImage::Client.new(query: query).get
      end
    end
  end
end
