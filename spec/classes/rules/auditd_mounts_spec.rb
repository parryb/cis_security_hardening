# frozen_string_literal: true

require 'spec_helper'

enforce_options = [true, false]
arch_options = ['x86_64', 'i686']

describe 'cis_security_hardening::rules::auditd_mounts' do
  on_supported_os.each do |os, os_facts|
    enforce_options.each do |enforce|
      arch_options.each do |arch|
        context "on #{os} with enforce = #{enforce} and arch = #{arch}" do
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
          let(:facts) do
            os_facts.merge!(
              architecture: arch.to_s,
              cis_security_hardening: {
                auditd: {
                  uid_min: '1000',
                  mounts: false,
                },
              },
            )
          end
          let(:params) do
            {
              'enforce' => enforce,
            }
          end

          it {
            is_expected.to compile

            if enforce
              is_expected.to contain_concat__fragment('watch mounts rule 1')
                .with(
                  'order' => '81',
                  'target' => '/etc/audit/rules.d/cis_security_hardening.rules',
                  'content' => '-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
                )

              if os_facts[:operatingsystem].casecmp('redhat').zero?
                is_expected.to contain_concat__fragment('watch mounts rule 3')
                  .with(
                    'order' => '215',
                    'target' => '/etc/audit/rules.d/cis_security_hardening.rules',
                    'content' => '-a always,exit -F path=/usr/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount',
                  )
              end

              if ['x86_64', 'amd64'].include?(arch)
                is_expected.to contain_concat__fragment('watch mounts rule 2')
                  .with(
                    'order' => '82',
                    'target' => '/etc/audit/rules.d/cis_security_hardening.rules',
                    'content' => '-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
                  )
              else
                is_expected.not_to contain_concat__fragment('watch mounts rule 2')
              end
            else
              is_expected.not_to contain_concat__fragment('watch mounts rule 1')
              is_expected.not_to contain_concat__fragment('watch mounts rule 2')
            end
          }
        end
      end
    end
  end
end
