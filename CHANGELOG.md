# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v1.0.1](https://github.com/bwitt/cis_security_hardening/tree/v1.0.1) (2026-01-04)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v1.0.0...v1.0.1)

## [v1.0.0](https://github.com/bwitt/cis_security_hardening/tree/v1.0.0) (2026-01-04)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.9.7...v1.0.0)

**Breaking changes:**

- Remove space from login screen settings on sles [\#9](https://github.com/bwitt/cis_security_hardening/pull/9) ([bwitt](https://github.com/bwitt))

**Implemented enhancements:**

- Add precommit [\#37](https://github.com/bwitt/cis_security_hardening/pull/37) ([bwitt](https://github.com/bwitt))
- Add Ubuntu 24.04 Support [\#35](https://github.com/bwitt/cis_security_hardening/pull/35) ([bwitt](https://github.com/bwitt))
- Migrate to voxpupuli modulesync\_config [\#34](https://github.com/bwitt/cis_security_hardening/pull/34) ([bwitt](https://github.com/bwitt))
- Add rubocop settings and strings [\#33](https://github.com/bwitt/cis_security_hardening/pull/33) ([bwitt](https://github.com/bwitt))
- Use dconf module for GNOME dconf [\#31](https://github.com/bwitt/cis_security_hardening/pull/31) ([bwitt](https://github.com/bwitt))
- Clean ups and additions [\#30](https://github.com/bwitt/cis_security_hardening/pull/30) ([bwitt](https://github.com/bwitt))
- Use tabs for sudo defaults [\#28](https://github.com/bwitt/cis_security_hardening/pull/28) ([bwitt](https://github.com/bwitt))
- Remove sysctl exec [\#27](https://github.com/bwitt/cis_security_hardening/pull/27) ([bwitt](https://github.com/bwitt))
- Switch to gha-puppet workflow [\#26](https://github.com/bwitt/cis_security_hardening/pull/26) ([bwitt](https://github.com/bwitt))
- Make grub bootloader line a param [\#19](https://github.com/bwitt/cis_security_hardening/pull/19) ([bwitt](https://github.com/bwitt))
- Update devcontainer and CI [\#18](https://github.com/bwitt/cis_security_hardening/pull/18) ([bwitt](https://github.com/bwitt))
- Manage world writeable cron file [\#14](https://github.com/bwitt/cis_security_hardening/pull/14) ([bwitt](https://github.com/bwitt))
- allow params to be set for logrotate class [\#8](https://github.com/bwitt/cis_security_hardening/pull/8) ([bwitt](https://github.com/bwitt))
- adopt augeasproviders\_sysctl module [\#6](https://github.com/bwitt/cis_security_hardening/pull/6) ([bwitt](https://github.com/bwitt))
- Load gdm\_screensaver on ubuntu 22.04 [\#5](https://github.com/bwitt/cis_security_hardening/pull/5) ([bwitt](https://github.com/bwitt))

**Fixed bugs:**

- ignore devcontainer json [\#44](https://github.com/bwitt/cis_security_hardening/pull/44) ([bwitt](https://github.com/bwitt))
- Ignore CHANGELOG.md for markdown checks [\#43](https://github.com/bwitt/cis_security_hardening/pull/43) ([bwitt](https://github.com/bwitt))
- Fix remaining issues on Ubuntu 24.04 [\#38](https://github.com/bwitt/cis_security_hardening/pull/38) ([bwitt](https://github.com/bwitt))
- Fail if no bundles match [\#36](https://github.com/bwitt/cis_security_hardening/pull/36) ([bwitt](https://github.com/bwitt))
- Add missing namespaced ensure\_packages [\#29](https://github.com/bwitt/cis_security_hardening/pull/29) ([bwitt](https://github.com/bwitt))
- Notify timesyncd on change [\#23](https://github.com/bwitt/cis_security_hardening/pull/23) ([bwitt](https://github.com/bwitt))
- Set nologin for ubuntu and sles [\#22](https://github.com/bwitt/cis_security_hardening/pull/22) ([bwitt](https://github.com/bwitt))
- Make cron.allow world readable [\#21](https://github.com/bwitt/cis_security_hardening/pull/21) ([bwitt](https://github.com/bwitt))
- Have auditd\_init require the auditd package [\#20](https://github.com/bwitt/cis_security_hardening/pull/20) ([bwitt](https://github.com/bwitt))
- Fix logrotate spec so tests pass [\#17](https://github.com/bwitt/cis_security_hardening/pull/17) ([bwitt](https://github.com/bwitt))
- Manage auditd cron output file and fix cron [\#16](https://github.com/bwitt/cis_security_hardening/pull/16) ([bwitt](https://github.com/bwitt))
- Use audit for pam\_faillock [\#15](https://github.com/bwitt/cis_security_hardening/pull/15) ([bwitt](https://github.com/bwitt))
- Use success=1 for faillock [\#13](https://github.com/bwitt/cis_security_hardening/pull/13) ([bwitt](https://github.com/bwitt))
- Use pam\_pwhistory for ubuntu 22.04 [\#12](https://github.com/bwitt/cis_security_hardening/pull/12) ([bwitt](https://github.com/bwitt))
- Fix ufw classes [\#11](https://github.com/bwitt/cis_security_hardening/pull/11) ([bwitt](https://github.com/bwitt))
- Manage systemd-timesyncd package if enforced [\#10](https://github.com/bwitt/cis_security_hardening/pull/10) ([bwitt](https://github.com/bwitt))
- Update fixtures file for new sysctl module [\#7](https://github.com/bwitt/cis_security_hardening/pull/7) ([bwitt](https://github.com/bwitt))
- Use /etc/gdm3/greeter.dconf-defaults for ubuntu [\#4](https://github.com/bwitt/cis_security_hardening/pull/4) ([bwitt](https://github.com/bwitt))
- Add /sbin and /usr/sbin to path for dpkg-reconfigure [\#3](https://github.com/bwitt/cis_security_hardening/pull/3) ([bwitt](https://github.com/bwitt))
- Use namespaced stdlib function [\#2](https://github.com/bwitt/cis_security_hardening/pull/2) ([bwitt](https://github.com/bwitt))
- fix logrotate\_configuration enforcement [\#1](https://github.com/bwitt/cis_security_hardening/pull/1) ([bwitt](https://github.com/bwitt))

**Merged pull requests:**

- Markdown and maintainer change [\#40](https://github.com/bwitt/cis_security_hardening/pull/40) ([bwitt](https://github.com/bwitt))

## [v0.9.7](https://github.com/bwitt/cis_security_hardening/tree/v0.9.7) (2024-09-16)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.9.6...v0.9.7)

## [v0.9.6](https://github.com/bwitt/cis_security_hardening/tree/v0.9.6) (2024-09-07)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.9.3...v0.9.6)

## [v0.9.3](https://github.com/bwitt/cis_security_hardening/tree/v0.9.3) (2024-03-28)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.9.2...v0.9.3)

## [v0.9.2](https://github.com/bwitt/cis_security_hardening/tree/v0.9.2) (2024-01-28)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.9.1...v0.9.2)

## [v0.9.1](https://github.com/bwitt/cis_security_hardening/tree/v0.9.1) (2023-12-28)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.8.4...v0.9.1)

## [v0.8.4](https://github.com/bwitt/cis_security_hardening/tree/v0.8.4) (2023-09-04)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.8.2...v0.8.4)

## [v0.8.2](https://github.com/bwitt/cis_security_hardening/tree/v0.8.2) (2023-08-15)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.8.0...v0.8.2)

## [v0.8.0](https://github.com/bwitt/cis_security_hardening/tree/v0.8.0) (2023-08-07)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.13...v0.8.0)

## [v0.7.13](https://github.com/bwitt/cis_security_hardening/tree/v0.7.13) (2023-05-09)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.10...v0.7.13)

## [v0.7.10](https://github.com/bwitt/cis_security_hardening/tree/v0.7.10) (2022-11-13)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.9...v0.7.10)

## [v0.7.9](https://github.com/bwitt/cis_security_hardening/tree/v0.7.9) (2022-11-08)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.8...v0.7.9)

## [v0.7.8](https://github.com/bwitt/cis_security_hardening/tree/v0.7.8) (2022-10-28)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.7...v0.7.8)

## [v0.7.7](https://github.com/bwitt/cis_security_hardening/tree/v0.7.7) (2022-10-25)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.6...v0.7.7)

## [v0.7.6](https://github.com/bwitt/cis_security_hardening/tree/v0.7.6) (2022-10-18)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.5...v0.7.6)

## [v0.7.5](https://github.com/bwitt/cis_security_hardening/tree/v0.7.5) (2022-10-16)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.3...v0.7.5)

## [v0.7.3](https://github.com/bwitt/cis_security_hardening/tree/v0.7.3) (2022-10-07)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.2...v0.7.3)

## [v0.7.2](https://github.com/bwitt/cis_security_hardening/tree/v0.7.2) (2022-10-06)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.1...v0.7.2)

## [v0.7.1](https://github.com/bwitt/cis_security_hardening/tree/v0.7.1) (2022-09-02)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.7.0...v0.7.1)

## [v0.7.0](https://github.com/bwitt/cis_security_hardening/tree/v0.7.0) (2022-08-27)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.6.2...v0.7.0)

## [v0.6.2](https://github.com/bwitt/cis_security_hardening/tree/v0.6.2) (2022-08-24)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.6.1...v0.6.2)

## [v0.6.1](https://github.com/bwitt/cis_security_hardening/tree/v0.6.1) (2022-08-22)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/v0.6.0...v0.6.1)

## [v0.6.0](https://github.com/bwitt/cis_security_hardening/tree/v0.6.0) (2022-08-21)

[Full Changelog](https://github.com/bwitt/cis_security_hardening/compare/6529c07f4c95f5cf4249bfa8b521782f19d85ba4...v0.6.0)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
