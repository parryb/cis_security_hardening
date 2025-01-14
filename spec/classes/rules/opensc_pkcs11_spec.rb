# frozen_string_literal: true

require 'spec_helper'

enforce_options = [true, false]

describe 'cis_security_hardening::rules::opensc_pkcs11' do
  on_supported_os.each do |_os, os_facts|
    enforce_options.each do |enforce|
      context 'on RedHat' do
        let(:facts) { os_facts }
        let(:params) do
          {
            'enforce' => enforce,
          }
        end

        it {
          is_expected.to compile

          if enforce
            if os_facts[:operatingsystem].casecmp('redhat').zero?
              is_expected.to contain_package('opensc')
                .with(
                  'ensure' => 'installed',
                )
            else
              is_expected.to contain_package('opensc-pkcs11')
                .with(
                  'ensure' => 'installed',
                )
            end
          else
            is_expected.not_to contain_package('opensc-pkcs11')
            is_expected.not_to contain_package('opensc')
          end
        }
      end
    end
  end
end
