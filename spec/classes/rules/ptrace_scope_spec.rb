# frozen_string_literal: true

require 'spec_helper'

enforce_options = [true, false]

describe 'cis_security_hardening::rules::ptrace_scope' do
  on_supported_os.each do |os, os_facts|
    enforce_options.each do |enforce|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) do
          {
            'enforce' => enforce,
          }
        end

        it {
          is_expected.to compile

          if enforce
            is_expected.to contain_sysctl('kernel.yama.ptrace_scope')
              .with(
                'value' => 1,
              )
          else
            is_expected.not_to contain_sysctl('kernel.yama.ptrace_scope')
          end
        }
      end
    end
  end
end
