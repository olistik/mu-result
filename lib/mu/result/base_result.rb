module Mu
  module Result

    class BaseResult
      def initialize(is_success: true, code: :ok, data: nil)
        @is_success = is_success
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
        @is_success == true
      end

      def error?
        !success?
      end

      def unwrap(symbol = nil)
        return data if symbol.nil?

        if !data.respond_to?(:include?) || !data.include?(symbol)
          messages = []
          messages << "The symbol '#{symbol}' is not included in the result data object."
          messages += caller
          raise StandardError.new(messages.join("\n"))
        end

        return data[symbol]
      end

      def to_hash
        {
          code: code,
          data: data,
        }
      end
    end

  end
end
