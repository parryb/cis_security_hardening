# frozen_string_literal: true

require 'spec_helper'

enforce_options = [true, false]

describe 'cis_security_hardening::rules::dovecot' do
  on_supported_os.each do |os, os_facts|
    enforce_options.each do |enforce|
      context "on #{os} with enforce = #{enforce}" do
        let(:facts) { os_facts }
        let(:params) do
          {
            'enforce' => enforce,
          }
        end

        it {
          is_expected.to compile

          if enforce

            if os_facts[:operatingsystem].casecmp('ubuntu').zero?
              is_expected.to contain_package('dovecot-imapd')
                .with(
                  'ensure' => 'purged',
                )

              is_expected.to contain_package('dovecot-pop3d')
                .with(
                  'ensure' => 'purged',
                )
            elsif os_facts[:operatingsystem].casecmp('sles').zero?
              is_expected.to contain_package('dovecot')
                .with(
                  'ensure' => 'absent',
                )
            else
              is_expected.to contain_service('dovecot')
                .with(
                  'ensure' => 'stopped',
                  'enable' => false,
                )
            end
          else
            is_expected.not_to contain_service('dovecot')
            is_expected.not_to contain_package('dovecot')
            is_expected.not_to contain_package('dovecot-imapd')
            is_expected.not_to contain_package('dovecot-pop3d')
          end
        }
      end
    end
  end
end
