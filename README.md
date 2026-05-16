# gamescope-reloaded 🚀

A lightweight, automated display engine wrapper and environment configuration suite designed to streamline high-performance HDR and adaptive-sync gaming on Linux desktop environments.

This repository splits system optimization into two distinct phases: a one-time global environment provisioning script and a high-performance, dynamic hardware-matching display launcher (`gscope`).

---

## 🛠️ Features

* **Dynamic Resolution Targeting:** Automatically parses GNOME's native `monitors.xml` configuration to target whichever display is actively flagged as your **Primary** monitor, handling high-refresh-rate layouts gracefully.
* **Failsafe Geometry Fallbacks:** Robust parameter expansion logic ensures that if configuration files are missing, the system automatically drops back to working defaults rather than crashing the display server.
* **Systemd Environment Provisioning:** Automatically deploys `environment.d` modules to enforce Wayland pipelines and Proton optimizations across all gaming execution wrappers (Steam, Lutris, etc.).
* **Zero-Overhead Launcher:** Replaces the execution thread entirely using standard Linux `exec` bindings, ensuring the wrapper adds exactly 0% CPU/memory overhead while your game is active.

---

## 📦 Project Structure

```text
gamescope-reloaded/
├── Makefile             # Automated installation and teardown compiler
├── README.md            # Project documentation
├── gscope               # The gamescope wrapper
└── setup_gaming_env.sh  # One-time ENV configs for proton flags.


Here is the fully consolidated, complete `README.md` file. It incorporates your troubleshooting steps, the `~/.zshrc` path configuration breakdown, and the verification metrics directly into the **Quick Start** and **Usage** sections so the documentation covers everything from scratch.

---

### The Final `README.md`

```markdown
# gamescope-reloaded 🚀

A lightweight, automated display engine wrapper and environment configuration suite designed to streamline high-performance HDR and adaptive-sync gaming on Linux desktop environments.

This repository splits system optimization into two distinct phases: a one-time global environment provisioning script and a high-performance, dynamic hardware-matching display launcher (`gscope`).

---

## 🛠️ Features

* **Dynamic Resolution Targeting:** Automatically parses GNOME's native `monitors.xml` configuration to target whichever display is actively flagged as your **Primary** monitor, handling high-refresh-rate layouts gracefully.
* **Failsafe Geometry Fallbacks:** Robust parameter expansion logic ensures that if configuration files are missing, the system automatically drops back to working defaults rather than crashing the display server.
* **Systemd Environment Provisioning:** Automatically deploys `environment.d` modules to enforce Wayland pipelines and Proton optimizations across all gaming execution wrappers (Steam, Lutris, etc.).
* **Zero-Overhead Launcher:** Replaces the execution thread entirely using standard Linux `exec` bindings, ensuring the wrapper adds exactly 0% CPU/memory overhead while your game is active.

---

## 📦 Project Structure

```text
gamescope-reloaded/
├── Makefile             # Automated installation and teardown compiler
├── README.md            # Project documentation
├── gscope               # The extensionless dynamic display launcher
└── setup_gaming_env.sh  # One-time system environment configuration script

```

---

## 🚀 Quick Start

### 1. Prereqs

Ensure you have `gamescope` and `make` installed on your distribution:

```bash
# Fedora
sudo dnf install gamescope make

# Ubuntu
sudo apt-get install gamescope make
```



### 2. Deploy Everything

Run the automated `Makefile` from the project root to provision your environment files and install the launcher to your local path:

```bash
make

```

### 3.  [OPTIONAL] Update Your Shell Path (Zsh Configuration)

I use zsh, I made this script to be used with bash for ease of use for everyone else. Follow these instructions for your given usecase

While Bash typically looks at `~/.local/bin` out of the box on modern systems, **Zsh** operates on a standalone profile. If your terminal shell is Zsh and `~/.local/bin` isn't already in your system path, run the following commands to map it globally:

```zsh
# Append the binary path to your Zsh configuration profile
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc

# Force your active shell window to reload and apply the environment variable
source ~/.zshrc

```

---

## 🎮 How To Use & Verify

### Step 1: Verify Shell Integration

Before linking to your gaming engines, confirm that your active shell can trace the path resolution cleanly. Run:

```zsh
which gscope

```

A successful configuration will instantly return the explicit target route: `/home/$USER/.local/bin/gscope`.

### Step 2: Test Initialization

Run the utility standalone in a terminal window to check the dynamic hardware parsing layout:

```zsh
gscope

```

### Step 3: Steam Integration

To use the dynamic display wrapper, open your game's **Properties** panel inside Steam and append the command directly to your **Launch Options**:

```text
gscope %command%

```

### Expected Output Logs

When launched, `gscope` intercepts the initialization call, fetches your primary monitor parameters, prints out the execution blueprint, and hooks into Gamescope cleanly:

Remember - your output will vary according to your monitor specs. These are mine so...

```text
Detected Primary Hardware Layout: 5120x2160 @ 165Hz
Launching: gamescope -w 5120 -h 2160 -W 5120 -H 2160 -r 165 -f --hdr-enabled --adaptive-sync -- ...
[gamescope] [Info] console: gamescope version (gcc 16.0.1)

```

---

## ⚙️ Advanced Makefile Targets

The included `Makefile` handles standard environment workflows safely:

* `make` (or `make all`): Safe execution. Copies/updates the `gscope` launcher but **leaves your active environment configurations completely untouched** so you don't accidentally overwrite manual edits.
* `make clean`: Completely uninstalls all binaries and environment modules from your system, leaving your user folders clean.

---

## 🔗 Deep-Dive Resources

* [The Linux HDR Customization Guide](https://github.com/DXC-0/Linux-HDR-Guide)
* [Arch Linux Gaming Optimization Wiki](https://wiki.archlinux.org/title/Gaming)
* [GloriousEggroll Custom Proton Release Tree](https://github.com/GloriousEggroll/proton-ge-custom)

```
