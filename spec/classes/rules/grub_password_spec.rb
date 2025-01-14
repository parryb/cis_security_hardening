# frozen_string_literal: true

require 'spec_helper'

enforce_options = [true, false]
grub_pws = ['', 'grub.pbkdf2.sha512.10000.943.....']

describe 'cis_security_hardening::rules::grub_password' do
  on_supported_os.each do |os, os_facts|
    enforce_options.each do |enforce|
      grub_pws.each do |grubpw|
        context "on #{os} with enforce = #{enforce}, pw = #{grubpw}" do
          let(:facts) { os_facts }
          let(:params) do
            {
              'enforce' => enforce,
              'grub_password_pbkdf2' => grubpw,
            }
          end

          it {
            is_expected.to compile

            if enforce && grubpw == ''
              is_expected.to contain_echo('No grub password defined')
                .with(
                  'message'  => 'Enforcing a grub boot password needs a grub password to be defined. Please define an encrypted in Hiera.',
                  'loglevel' => 'warning',
                  'withpath' => false,
                )
            end

            if os_facts[:osfamily].casecmp('redhat').zero?

              is_expected.not_to contain_file('/etc/grub.d/user.cfg')
              is_expected.not_to contain_exec('bootpw-grub-config-ubuntu')

              if enforce && grubpw != ''
                is_expected.to contain_file('/boot/grub2/user.cfg')
                  .with(
                    'ensure' => 'file',
                    'owner'  => 'root',
                    'group'  => 'root',
                    'mode'   => '0600',
                  )
                  .that_notifies('Exec[bootpw-grub-config]')

                is_expected.to contain_exec('bootpw-grub-config')
                  .with(
                    'command'     => 'grub2-mkconfig -o /boot/grub2/grub.cfg',
                    'path'        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
                    'refreshonly' => true,
                  )
              else
                is_expected.to contain_file('/boot/grub2/user.cfg')
                  .with(
                    'ensure' => 'file',
                    'owner'  => 'root',
                    'group'  => 'root',
                    'mode'   => '0600',
                  )
                is_expected.not_to contain_exec('bootpw-grub-config')
              end

            elsif os_facts[:osfamily].casecmp('debian').zero?

              is_expected.not_to contain_file('/boot/grub2/user.cfg')
              is_expected.not_to contain_exec('bootpw-grub-config')

              if enforce && grubpw != ''
                is_expected.to contain_file('/etc/grub.d/50_custom')
                  .with(
                    'ensure' => 'file',
                    'owner'  => 'root',
                    'group'  => 'root',
                    'mode'   => '0755',
                  )
                  .that_notifies('Exec[bootpw-grub-config-ubuntu]')

                is_expected.to contain_file_line('grub-unrestricted')
                  .with(
                    'ensure' => 'present',
                    'path'   => '/etc/grub.d/10_linux',
                    'line'   => 'CLASS="--class gnu-linux --class gnu --class os --unrestricted"',
                    'match'  => '^CLASS="--class gnu-linux --class gnu --class os"',
                    'append_on_no_match' => false,
                  )
                  .that_notifies('Exec[bootpw-grub-config-ubuntu]')

                is_expected.to contain_exec('bootpw-grub-config-ubuntu')
                  .with(
                    'command'     => 'update-grub',
                    'path'        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
                    'refreshonly' => true,
                  )
              else
                is_expected.not_to contain_file('/etc/grub.d/50_custom')
                is_expected.not_to contain_exec('bootpw-grub-config-ubuntu')
                is_expected.not_to contain_file_line('grub-unrestricted')
              end

            elsif os_facts[:osfamily].casecmp('suse').zero?

              is_expected.not_to contain_file('/boot/grub2/user.cfg')
              is_expected.not_to contain_exec('bootpw-grub-config')
              is_expected.not_to contain_file('/etc/grub.d/50_custom')
              is_expected.not_to contain_exec('bootpw-grub-config-ubuntu')
              is_expected.not_to contain_file_line('grub-unrestricted')

              if enforce && grubpw != ''
                is_expected.to contain_file('/etc/grub.d/40_custom')
                  .with(
                    'ensure'  => 'file',
                    'owner'   => 'root',
                    'group'   => 'root',
                    'mode'    => '0755',
                  )
                  .that_notifies('Exec[bootpw-grub-config-sles]')

                is_expected.to contain_exec('bootpw-grub-config-sles')
                  .with(
                    'command'     => 'grub2-mkconfig -o /boot/grub2/grub.cfg',
                    'path'        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
                    'refreshonly' => true,
                  )
              end

            end
          }
        end
      end
    end
  end
end
