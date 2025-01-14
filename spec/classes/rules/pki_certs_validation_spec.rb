# frozen_string_literal: true

require 'spec_helper'

enforce_options = [true, false]

describe 'cis_security_hardening::rules::pki_certs_validation' do
  on_supported_os.each do |os, os_facts|
    enforce_options.each do |enforce|
      context "on #{os}" do
        let(:facts) do
          os_facts.merge!(
            'cis_security_hardening' => {
              'systemd-coredump' => 'yes',
              'pkcs11_config' => {
                'module' => 'opensc',
                'policy' => 'ca,signature',
              },
            },
          )
        end
        let(:params) do
          {
            'enforce' => enforce,
            'cert_policy' => 'ca,signature,ocsp_on;',
          }
        end

        it {
          is_expected.to compile

          if enforce
            is_expected.to contain_file_line('pki certs validation')
              . with(
                'ensure' => 'present',
                'path'   => '/etc/pam_pkcs11/pam_pkcs11.conf',
                'line'   => '    cert_policy = ca,signature,ocsp_on;',
                'match'  => '\\s*cert_policy =',
                'multiple' => true,
              )
          else
            is_expected.not_to contain_file_line('pki certs validation')
          end
        }
      end
    end
  end
end
