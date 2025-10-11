# frozen_string_literal: true

require 'spec_helper'

enforce_options = [true, false]

describe 'cis_security_hardening::rules::gdm_auto_mount' do
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
            if os_facts[:os]['name'].casecmp('debian').zero? && os_facts[:os]['release']['major'] > '10'
              is_expected.to contain_dconf__db('media-automount-autorun-never').
                with(
                  'db_dir'         => '/etc/dconf/db/local.d',
                  'db_filename'    => '00-media-automount',
                  'locks_filename' => '00-media-automount',
                  'settings'       => {
                    'org/gnome/desktop/media-handling' => {
                      'autorun-never' => 'true',
                    },
                  },
                  # rubocop:disable Layout/HashAlignment
                  'locks' => [
                    '/org/gnome/desktop/media-handling/autorun-never'
                  ]
                  # rubocop:enable Layout/HashAlignment
                )
            else
              is_expected.to contain_dconf__db('media-automount-automount').
                with(
                  'db_dir'         => '/etc/dconf/db/local.d',
                  'db_filename'    => '00-media-automount',
                  'locks_filename' => '00-media-automount',
                  'settings'       => {
                    'org/gnome/desktop/media-handling' => {
                      'automount' => 'false',
                      'automount-open' => 'false',
                    },
                  },
                  # rubocop:disable Layout/HashAlignment
                  'locks' => [
                    '/org/gnome/desktop/media-handling/automount',
                    '/org/gnome/desktop/media-handling/automount-open'
                  ]
                  # rubocop:enable Layout/HashAlignment
                )
            end
          else
            is_expected.not_to contain_dconf__db('media-automount-autorun-never')
            is_expected.not_to contain_dconf__db('media-automount-automount')
          end
        }
      end
    end
  end
end
