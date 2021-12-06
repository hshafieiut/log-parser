module LexerTypes
    class SimpleSpace
      attr_reader :line
     
      def initialize(line:)
        @line = line
      end

      def run
        line.split(' ')
      end

    end
end