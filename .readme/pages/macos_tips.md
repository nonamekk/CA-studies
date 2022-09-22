<a href="../../README.md">
<img src="../../.readme/assets/codeacademy-white.svg" height="42">
</a>

## MacOS Tips'n'Tricks

### Finding the ` and ~
In order to change the MacOS UK defaults § and ± run script from the 
terminal:
```
hidutil property --set 
'{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064}]}'
``` 

<b>

#### Wrapping it into more concise script:
> Make it executable with <code>chmod +x script.sh</code> and run with 
<code>/.script.sh <command></code>
```sh
#!/bin/sh
# Adapted from https://apple.stackexchange.com/a/353941 under CC BY 4.0
set -e

PLIST="/Library/LaunchDaemons/org.custom.tilde-switch.plist"

case $1 in
on)
  hidutil property --set '{"UserKeyMapping":[
    {
      "HIDKeyboardModifierMappingSrc": 0x700000035,
      "HIDKeyboardModifierMappingDst": 0x700000064
    },
    {
      "HIDKeyboardModifierMappingSrc": 0x700000064,
      "HIDKeyboardModifierMappingDst": 0x700000035
    }
  ]}'
  ;;
off)
  hidutil property --set '{"UserKeyMapping":[]}'
  ;;
install)
  sudo sh -c "cat > ${PLIST}" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>org.custom.tilde-switch</string>
    <key>Program</key>
    <string>${HOME}/bin/switch-tilde-keys</string>
    <key>ProgramArguments</key>
      <array>
        <string>on</string>
      </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <false/>
  </dict>
</plist>
EOF
  sudo launchctl load -w -- ${PLIST}
  ;;
uninstall)
  sudo launchctl unload -w -- ${PLIST} && sudo rm -f -- ${PLIST}
  ;;
*)
  echo "Usage: $0 on|off|install|uninstall" >&2
  exit 1
  ;;
esac
```
