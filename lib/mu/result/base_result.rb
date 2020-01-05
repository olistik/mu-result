module Mu
  module Result

    class BaseResult
      def initialize(code: :ok, data: nil)
        @code = code
        @data = data
      end

      def code!(value)
        @code = value
        self
      end

      def code
        @code
      end

      def data
        @data
      end

      def success?
        @code == :ok
      end

      def error?
        !success?
      end

      def unwrap(symbol = nil)
        return data if symbol.nil?

        if !data.respond_to?(:include?) || !data.include?(symbol)
          raise StandardError.new("The symbol '#{symbol}' is not included in the result data object.")
        end

        return data[symbol]
      end
    end

  end
end