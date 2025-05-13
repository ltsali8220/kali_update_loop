# 🔧 APT Upgrade Tool

A simple and reliable Bash script to safely upgrade all APT packages **one at a time**, ideal for use on **Debian-based systems** such as **Ubuntu** or **Kali Linux**.

This tool is especially helpful when you encounter broken or partially installed packages, offering a cleaner and more controlled upgrade process.

---

## ✨ Features

- Refreshes package lists (`apt update`)
- Detects all upgradable packages
- Upgrades each package individually for better visibility and error isolation
- Automatically removes unnecessary packages (`apt autoremove`)
- Safe and transparent process with clear terminal output

---

## 📦 Installation

1. **Download or create the script file** named `upgrade.sh`:

   ```bash
   #!/bin/bash

   if [[ "$1" == "--help" ]]; then
       echo "Usage: upgrade"
       echo "Safely upgrades APT packages one by one and performs cleanup."
       exit 0
   fi

   sudo apt update
   UPGRADABLE=$(apt list --upgradable | grep -oP '^\S+' | tail -n +2)

   for package in $UPGRADABLE; do
       echo "Upgrading $package..."
       sudo apt install --only-upgrade -y "$package"
   done

   sudo apt autoremove -y

   echo "All packages upgraded."
Make the script executable:

bash
Copy
Edit
chmod +x upgrade.sh
Move it to /usr/local/bin for global access:

bash
Copy
Edit
sudo mv upgrade.sh /usr/local/bin/upgrade
Run it from anywhere:

bash
Copy
Edit
upgrade
💡 Use Case
This tool is particularly useful on systems like Kali Linux, where:

Packages often break due to aggressive or custom installations

You want better visibility and control over the upgrade process

You want to recover from a broken APT state

🛡️ Requirements
A Debian-based Linux distribution

APT package manager (apt)

sudo privileges

⏰ Optional Automation
To automate upgrades, add the script to your crontab:

bash
Copy
Edit
crontab -e
Example entry to run weekly at 2 AM:

bash
Copy
Edit
0 2 * * 1 /usr/local/bin/upgrade >> /var/log/apt-upgrade.log 2>&1
🪪 License
This project is licensed under the MIT License.

sql
Copy
Edit
MIT License

Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
🤝 Contributions
Contributions are welcome. If you have suggestions or improvements, feel free to submit a pull request or open an issue.

vbnet
Copy
Edit

Let me know if you'd like this exported as a downloadable `.md` file or formatted for GitHub Pages.


