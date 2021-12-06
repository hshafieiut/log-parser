class Hit
    attr_reader :uri, :ip
  
    def initialize(uri:, ip:)
      validate_presence(uri, ip)
      @uri = uri
      @ip = ip
    end
  
    private

    def validate_presence(uri, ip)
      if !valid_presence?(uri) || !valid_presence?(ip)
        raise ArgumentError, "Arguments can't be blank?"
      end
    end
  
    def valid_presence?(argument)
      return false if argument.nil? || argument.strip.empty?
      true
    end
  end