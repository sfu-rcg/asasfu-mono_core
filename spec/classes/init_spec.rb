require 'spec_helper'
describe 'mono_core' do

  context 'with defaults for all parameters' do
    it { should contain_class('mono_core') }
  end
end
