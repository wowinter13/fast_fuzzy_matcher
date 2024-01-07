# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FuzzyMatcher do
  it "has a version number" do
    expect(FuzzyMatcher::VERSION).not_to be nil
  end

  describe "#find" do
    it "responds with an empty array when no matches are found" do
      expect(FuzzyMatcher.find("foo", ["bar", "baz"])).to eq([])
    end
    
    it "responds with an empty array when no targets are given" do
      expect(FuzzyMatcher.find("foo", [])).to eq([])
    end

    it "responds with matches when the source is a substring of a target" do
      expect(FuzzyMatcher.find("whl", ["cartwheel", "foobar", "wheel", "baz"])).to eq(["cartwheel", "wheel"])
    end

    it "does not respond with matches when the source is a substring of a target and the source is uppercase" do
      expect(FuzzyMatcher.find("WHL", ["cartwheel", "foobar", "wheel", "baz"])).to eq([])
    end
  end
end
