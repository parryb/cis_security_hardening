# frozen_string_literal: true

# read open ports
def read_open_ports
  opports = []
  ss_cmd = ''
  cmds = ['/usr/sbin/ss', '/usr/bin/ss', '/bin/ss', '/sbin/ss']
  cmds.each do |cmd|
    ss_cmd = cmd if File.exist?(cmd)
  end

  unless ss_cmd.empty?

    val = Facter::Core::Execution.exec("#{ss_cmd} -4tuln")
    lines = if val.nil? || val.empty?
              []
            else
              val.split("\n")
            end
    lines.each do |line|
      next if %r{^Netid}.match?(line)

      data = line.split
      proto = data[0].strip
      local = data[4].split(':')
      port = local[1].strip
      opports.push("#{proto}:#{port}") if local[0] != '127.0.0.1'
    end
  end

  opports.uniq
end
