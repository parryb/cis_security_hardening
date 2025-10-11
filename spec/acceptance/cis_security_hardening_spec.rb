# frozen_string_literal: true

require 'spec_helper_acceptance'

pp = <<-MANIFEST
  include cis_security_hardening
MANIFEST

describe 'cis_security_hardening class' do
  context 'with default parameters' do
    it 'works with no errors' do
      apply_manifest(pp, catch_failures: true)

      expect(file('/usr/share/cis_security_hardening')).to be_directory
      expect(file('/usr/share/cis_security_hardening/logs')).to be_directory
    end

    it 'is idempotent' do
      apply_manifest(pp, catch_changes: true)
    end
  end
end
