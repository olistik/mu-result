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
          raise StandardError.new("The symbol '#{symbol}' is not included in the result data object.")
        end

        return data[symbol]
      end

      def to_hash
        {
          code: code,
          data: data,
        }
      end

      def merge_data(data)
        self.class.new(is_success: @is_success, code: @code, data: (@data || {}).merge(data))
      end
    end
  end
end
