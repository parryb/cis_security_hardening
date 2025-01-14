# frozen_string_literal: true

require 'spec_helper'

enforce_options = [true, false]

describe 'cis_security_hardening::rules::auditd_conf_perms' do
  let(:pre_condition) do
    <<-EOF
    class {'cis_security_hardening::rules::auditd_init':
      rules_file => '/etc/audit/rules.d/cis_security_hardening.rules',
    }

    class { 'cis_security_hardening::reboot':
      auto_reboot => true,
      time_until_reboot => 120,
    }
    EOF
  end

  on_supported_os.each do |os, os_facts|
    enforce_options.each do |enforce|
      context "on #{os} with enforce = #{enforce}" do
        let(:facts) do
          os_facts.merge!(
            cis_security_hardening: {
              auditd: {
                uid_min: '1000',
                auditing_process: 'none',
                config_files: ['/etc/audit/auditd.conf', '/etc/audit/audit.rules']
              },
            },
          )
        end
        let(:params) do
          {
            'enforce' => enforce,
            'user' => 'root',
            'group' => 'root',
            'mode' => '0640',
          }
        end

        it {
          is_expected.to compile

          if enforce
            is_expected.to contain_file('/etc/audit/auditd.conf')
              .with(
                'ensure' => 'file',
                'owner'  => 'root',
                'group'  => 'root',
                'mode'   => '0640',
              )
            is_expected.to contain_file('/etc/audit/audit.rules')
              .with(
                'ensure' => 'file',
                'owner'  => 'root',
                'group'  => 'root',
                'mode'   => '0640',
              )
          else
            is_expected.not_to contain_file('/etc/audit/auditd.conf')
            is_expected.not_to contain_file('/etc/audit/audit.rules')
          end
        }
      end
    end
  end
end
