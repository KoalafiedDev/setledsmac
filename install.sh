#!/bin/bash
set -euo pipefail

if (( $EUID != 0 )); then
    echo "Error: Please run with sudo"
    exit 1
fi

BINARY="$(stat -f "%N" ${1})"

if [[ ! -f "${BINARY}" ]]; then
  echo "Error: No file found at ${BINARY}"
  exit 1
fi

echo "Making sure the file is executable .. "
chmod +x "${BINARY}"

echo "Installing launch agent .. "
sed -e "s|%%BINARYPATH%%|${BINARY}|g" com.KoalafiedDev.setleds.plist.template > /Library/LaunchDaemons/com.KoalafiedDev.setleds.plist

echo "Setting launch agent permissions .. "
chown root:wheel /Library/LaunchDaemons/com.KoalafiedDev.setleds.plist

echo "Enabling the launch configuration .. "
launchctl load -w /Library/LaunchDaemons/com.KoalafiedDev.setleds.plist

echo "Starting the job .. "
launchctl start /Library/LaunchDaemons/com.KoalafiedDev.setleds.plist || :

# Open Accessibility settings and display instructions
echo "Opening System Preferences -> Security & Privacy -> Accessibility ..."
open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"

osascript -e 'display notification "Please add the SetLEDs app to Accessibility permissions in System Preferences -> Security & Privacy." with title "Accessibility Permission Required"'

echo "IMPORTANT: Grant Accessibility permission"
echo "1. Press: Command + Shift + G."
echo "2. Add the app binary located at: ${BINARY}"

echo "All done! Caps lock functionality should now be restored after a restart."