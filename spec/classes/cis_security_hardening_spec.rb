# frozen_string_literal: true

require 'spec_helper'

postrun_options = [true, false]

describe 'cis_security_hardening' do
  on_supported_os.each do |os, os_facts|
    postrun_options.each do |postrun|
      context "on #{os} with postrun = #{postrun}" do
        let(:facts) { os_facts }

        context 'using defaults' do
          let(:params) do
            {
              'level' => '2',
              'update_postrun_command' => postrun,
            }
          end

          it do
            is_expected.to compile.with_all_deps
            is_expected.to contain_class('cis_security_hardening::services')
            is_expected.to contain_class('cis_security_hardening::config')
            is_expected.to contain_class('cis_security_hardening::auditd_cron')

            if os_facts[:os]['name'].casecmp('ubuntu').zero? ||
               os_facts[:os]['name'].casecmp('debian').zero? ||
               os_facts[:os]['name'].casecmp('centos').zero? ||
               os_facts[:os]['name'].casecmp('redhat').zero? ||
               os_facts[:os]['name'].casecmp('almalinux').zero? ||
               os_facts[:os]['name'].casecmp('rocky').zero? ||
               os_facts[:os]['name'].casecmp('sles').zero?
              # These OSes should have bundles defined and compile successfully
              is_expected.to compile.with_all_deps
            else
              # Unsupported OSes should fail with no bundles found
              is_expected.to compile.and_raise_error(%r{No bundles found for this OS})
            end
          end
        end
      end
    end
  end
end
