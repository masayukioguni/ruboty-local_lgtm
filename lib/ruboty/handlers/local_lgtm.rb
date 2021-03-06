module Ruboty
  module Handlers
    class LocalLgtm < Base
      on /local_lgtm ? (?<keyword>.+)/, name: "build", description: "build lgtm image"
      
      env :RUBOTY_LOCAL_LGTM_API_URL, "local lgtm api url"

      def build(message)
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
