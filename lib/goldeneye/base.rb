module Goldeneye
  # Goldeneye::Base is the main class for mapping API resources as subclasses.
  class Base
    class << self
      # Returns the service name. By default it is infered from the class name.
      # E.g.: A "Goldeneye::Agent" class will have an "Agent" service
      def service
        name.split("::").last
      end
    end

    attr_reader :driver

    # Initializes the api using Goldeneye default options or the received options.
    # This accept the same options as Goldeneye.config.
    def initialize(options = {})
      @driver = Goldeneye.driver.new(self.class.service, options)
    end

    # Prepares and sends the API request to the configured server.
    #
    #  class MyClass < Base
    #    def create_server(name)
    #      perform_request("the.method", arg1, arg2, ...)
    #    end
    #  end
    #
    # <tt>method</tt> - Specifies which API method to execute
    # <tt>method</tt> - Specifies options that will be passed in to the API
    # <tt>force_array</tt> - see parse_response
    #
    # If the remote procedure returned a fault-structure, then a Goldeneye::GoldeneyeError exception
    # is raised.
    def perform_request(method, options = {}, force_array = false)
      Goldeneye.logger.debug("Goldeneye request for #{self.class.service}::#{method} with: #{options.to_s}")

      body     = driver.call(method, options)
      response = parse_response(method, body, force_array)

      Goldeneye.logger.debug("Goldeneye response: #{response.to_s}")

      response
    end

    private

    # Converts the XML response to a Hash
    #
    # <tt>force_array</tt> - Parses the xml element as an array; can be a string with the element name
    #     or an array with element names
    def parse_response(method, body, force_array = false)
      force_array     = Array(force_array) if force_array
      method_response = "#{method}Response"
      XmlSimple.xml_in(body, 'ForceArray' => force_array)["Body"][method_response]["return"]
    end
  end
end