# frozen_string_literal: true

# read grub configuration data
def read_grub_data
  grub = {}
  lines = Facter::Core::Execution.exec('grep /boot /etc/mtab').split("\n")
  uuid = ''
  mp = ''
  dev = ''

  lines.each do |line|
    data = line.split
    dev = data[0]
    mp = data[1]
    val = Facter::Core::Execution.exec("/sbin/blkid #{dev}")
    data = if val.nil? || val.empty?
             {}
           else
             val.split
           end

    uuid = data[1]
  end

  grub['boot_mountpoint'] = mp
  grub['boot_device'] = dev
  grub['boot_part_uuid'] = uuid

  grub
end
