require 'mu/result/version'
require 'mu/result/base_result'

module Mu
  module Result

    def self.success(data = nil)
      BaseResult.new(is_success: true, code: :ok, data: data)
    end

    def self.error(data = nil)
      BaseResult.new(is_success: false, code: :ko,  data: data)
    end

  end
end
