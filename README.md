# SetLEDs for macOS

SetLEDs is a command-line utility for macOS that allows users to control keyboard LED indicators, specifically the Caps Lock LED. This tool is particularly useful for keyboards that lack native macOS support, such as certain Cooler Master models.

---

## Features

- **Caps Lock LED Control:** Monitor and update the Caps Lock LED based on key activity.
- **Support for Non-Standard Keyboards:** Enhances compatibility with keyboards that do not have native macOS support.
- **Command-Line Interface:** Easily integrate LED control into scripts and automation workflows.

---

## Installation

### Option 1: Use the Precompiled Binary

1. **Download the Latest Release:**
   - Go to the [Releases page](https://github.com/KoalafiedDev/setledsmac/releases).
   - Download the latest precompiled binary.

2. **(Optional) Run the Installation Script:**
   If you want the Caps Lock LED to automatically update based on Caps Lock activity, follow these steps:
   
   - First, choose a location where you want the binary to be stored. It's recommended to place it in a directory like `/usr/local/bin/`, or a folder inside your user directory (e.g., `/Users/username/bin/`).
   
   - Run the following command to install the program with elevated permissions:
     ```bash
     sudo ./install.sh /path/to/setleds
     ```
     - Replace `/path/to/setleds` with the actual path where you placed the binary.
   
   The script will:
   - Make the binary executable.
   - Place the binary in the appropriate system directory.
   - Open the **Security & Privacy** settings page in **System Preferences** under the **Accessibility** section for you.

3. **Grant Accessibility Permissions:**
   - In the opened **Security & Privacy** settings window, click the **+** button under the **Accessibility** section.
   - Locate and add the `setleds` binary.
   
   **Note:** If the directory where you placed the binary isn't visible in the file picker:
   - Use the shortcut `Command + Shift + G` to open the "Go to Folder" dialog.
   - Enter the full path to the directory (e.g., `/usr/local/bin/`) and press **Enter**.

4. **Restart Your Mac:**
   - Restart your Mac to apply the Accessibility permission changes.

<br>
<br>

### Option 2: Build It Yourself from Source

If you prefer to compile the program yourself:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/KoalafiedDev/setledsmac.git
   cd setledsmac
   ```

2. **Compile the Program:**
   - Open the project in Xcode.
   - Select the appropriate build target.
   - Build the project to produce the binary.

3. **Run the Program:**
   - Once compiled, the binary can be found in the build directory.
   - Move it to a location of your choice and make it executable:
     ```bash
     chmod +x /path/to/setleds
     ```

---

## Usage

### Basic Manual LED Control

You can use the program directly in the terminal without running the installation script if you only want to control the LEDs manually:

- **Turn Off Caps Lock LED:**
  ```bash
  setleds -caps
  ```

- **Turn On Caps Lock LED:**
  ```bash
  setleds +caps
  ```

- **Toggle Caps Lock LED:**
  ```bash
  setleds ^caps
  ```

### Automatic Caps Lock LED Update

To enable automatic updates for the Caps Lock LED when the Caps Lock key is toggled, the installation script must be used. This will configure the necessary system permissions and services.

---

## Why Scroll Lock and Num Lock LEDs Cannot Be Updated Automatically

Unlike the Caps Lock key, macOS does not provide built-in system APIs or events for monitoring the state of Scroll Lock and Num Lock keys. This limitation is due to:

### Non-Standard Keys on macOS
- Scroll Lock and Num Lock keys are not part of the standard macOS keyboard layout.
- macOS lacks native constants or system-level hooks to detect state changes for these keys.

### Hardware Limitations
- The behavior of Scroll Lock and Num Lock LEDs depends on the hardware/firmware of the keyboard.
- Many keyboards implement these keys independently, without involving the operating system.

As a result, this program focuses on controlling the Caps Lock LED, which macOS supports more consistently.

---

## License

This project is licensed under the GNU General Public License v2.0. For more details, see the [LICENSE](LICENSE) file.

---

## Acknowledgments

- Original project by Damien Guard: [setledsmac](https://github.com/damienguard/setledsmac)
- Monitor mode added by Raj Perera: [setledsmac-monitor](https://github.com/rajperera/setledsmac-monitor)
- Modernized Caps Lock detection and framework improvements by [KoalafiedDev](https://github.com/KoalafiedDev/setledsmac)
