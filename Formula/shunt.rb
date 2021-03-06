class Shunt < Formula
  desc "DNS forwarder in Go"
  homepage "https://github.com/dhcmrlchtdj/shunt"
  head "https://github.com/dhcmrlchtdj/shunt.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  plist_options manual: "#{HOMEBREW_PREFIX}/opt/shunt/bin/shunt"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
            <array>
                <string>#{opt_bin}/shunt</string>
                <string>-conf</string>
                <string>#{etc}/shunt/config.json</string>
            </array>
            <key>RunAtLoad</key>
            <true/>
            <key>KeepAlive</key>
            <true/>
            <key>StandardOutPath</key>
            <string>#{var}/log/shunt.log</string>
            <key>StandardErrorPath</key>
            <string>#{var}/log/shunt.log</string>
          </dict>
      </plist>
    EOS
  end

  test do
    system "true"
  end
end
