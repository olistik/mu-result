require 'mu/result/version'
require 'mu/result/base_result'

module Mu
  module Result

    def self.success(data = nil)
      BaseResult.new(code: :ok, data: data)
    end

    def self.error(data = nil)
      BaseResult.new(code: :ko,  data: data)
    end

  end
end
