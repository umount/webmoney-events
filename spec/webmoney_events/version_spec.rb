require 'spec_helper'

describe 'WebmoneyEvents Version' do
  it 'has a version number' do
    expect(WebmoneyEvents::VERSION).to match(/\d+\.\d+\.\d+/)
  end
end
