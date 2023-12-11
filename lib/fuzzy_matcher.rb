# frozen_string_literal: true

require_relative "fuzzy_matcher/version"

require 'ffi'
require 'pry'
require 'benchmark'

module FuzzyMatcher
  class Error < StandardError; end

  def self.find(source, targets)
    pointers = targets.map { |t| FFI::MemoryPointer.from_string(t) }
    targets_ptr = FFI::MemoryPointer.new(:pointer, targets.size)
    targets_ptr.write_array_of_pointer(pointers)
  
    result_ptr = FuzzyBinding.Find(source, targets_ptr, targets.size)

    return [] if result_ptr.null?

    pointers_array = result_ptr.read_array_of_pointer(targets.size)
  
    result_array = pointers_array.each_with_object([]) do |ptr, arr|
      if ptr && !ptr.null?
        value = ptr.read_string_to_null
        arr << value unless value.nil? || value == ""
      end
    end

    FuzzyBinding.free_cstrings(result_ptr, targets.size)
  
    FFI::MemoryPointer.new(:pointer).write_pointer(result_ptr).free
  
    result_array
  end

  module FuzzyBinding
    extend FFI::Library
    ffi_lib File.expand_path("../ext/fuzzy.so", File.dirname(__FILE__))
  
    attach_function :Find, [:string, :pointer, :int], :pointer
    attach_function :free_cstrings, [:pointer, :int], :void
  end
end
