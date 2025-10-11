# frozen_string_literal: true

require 'spec_helper'

enforce_options = [true, false]

describe 'cis_security_hardening::rules::ctrl_alt_del_graphical' do
  on_supported_os.each do |os, os_facts|
    enforce_options.each do |enforce|
      context "on #{os} with enforce = #{enforce}" do
        let(:facts) do
          os_facts.merge(
            cis_security_hardening: {
              gnome_gdm_conf: false,
              gnome_gdm: true,
            }
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
            is_expected.to contain_dconf__db('disable-cad').
              with(
                'db_dir'         => '/etc/dconf/db/local.d',
                'db_filename'    => '00-disable-CAD',
                'locks_filename' => '00-disable-CAD',
                'settings'       => {
                  'org/gnome/settings-daemon/plugins/media-keys' => {
                    'logout' => '',
                  },
                },
                # rubocop:disable Layout/HashAlignment
                'locks' => [
                  '/org/gnome/settings-daemon/plugins/media-keys/logout'
                ]
                # rubocop:enable Layout/HashAlignment
              )
          else
            is_expected.not_to contain_dconf__db('disable-cad')
          end
        }
      end
    end
  end
end
