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
    end

  end
end