# To check the correct dependancies are set up for journald.

require 'spec_helper'
describe 'journald' do

  on_supported_os.each do |os, f|
    context "on #{os}" do
      let(:facts) do
        f.merge(super())
      end

      it { is_expected.to compile.with_all_deps }
      describe 'Testing the dependancies between the classes' do
        it { is_expected.to contain_class('journald::config') }
        it { is_expected.to contain_class('journald::service') }
        it { is_expected.to contain_class('journald::service').that_subscribes_to('Class[journald::config]') }
      end
    end
  end
end
