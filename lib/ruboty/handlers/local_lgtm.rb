module Ruboty
  module Handlers
    class LocalLgtm < Base
      on /build_lgtm ? (?<keyword>.+)/, name: "build", description: "build lgtm"

      def build(message)
        p message
        if url = lgtm(message[:keyword])
         message.reply(url)
        end
      end

      private

      def lgtm(image_url)
        Ruboty::LocalLgtm::Client.new(image_url: image_url).get
      end
    end
  end
end
