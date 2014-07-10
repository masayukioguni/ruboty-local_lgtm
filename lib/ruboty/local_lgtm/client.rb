require "uri"
require "json"
require "faraday"
require "faraday_middleware"

module Ruboty
  module LocalLgtm
    class Client

      attr_reader :options

      def initialize(options)
        @options = options
      end

      def get
        begin
          resource
        rescue Exception => e
          Ruboty.logger.error("Error: #{self}##{__method__} - #{exception}")
          nil
        end
      end

      private

      def resource
        download
        upload
      end

      def filename
        uri = URI.split image_url
        File.basename(uri[5])
      end 

      def download
        response = connection.get(image_url)
        File.open(filename, 'wb') { |fp| fp.write(response.body) }
      end 

      def upload
        conn = Faraday.new(url) do |f|
          f.request :multipart
          f.request :url_encoded
          f.adapter :net_http
        end

        res = conn.post('/api/images', { :file => Faraday::UploadIO.new(filename, 'image/jpeg') })
        json = JSON.parse(res.body)
        File.delete(filename)

        json["src"]

      end 

      def response
        connection.get(url, params)
      end

      def image_url
        options[:image_url]
      end 

      def url
        ENV["RUBOTY_LOCAL_LGTM_API_URL"]
      end

      def connection
        Faraday.new do |connection|
          connection.adapter :net_http
        end
      end
    end
  end
end