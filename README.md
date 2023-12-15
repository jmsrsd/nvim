# Neovim Dotfiles

🚀 Welcome to my Neovim setup! This repo is where I store my Neovim configuration files, aka dotfiles. Let's take a quick tour! 👇

![Screenshot](/screenshots/202311201429.png)

📄 **Main Configuration:**
Check out `init.lua` - the heartbeat of this setup. It kickstarts Neovim and pulls in the rest of the magic from various config files in the `lua` directory.

🔧 **Modular Approach:**
I've organized things into modules for clarity. The `lua/jmsrsd/configs` directory is where you'll find settings for plugins like `autopairs`, `barbecue`, `lsp`, and many more. Dive in!

🧰 **Utility Tools:**
In `lua/jmsrsd/utils`, I've stashed utility files like `array.lua`, `keymap.lua`, and others. Handy helpers for a smoother experience.

🔄 **Work in Progress:**
This repo is a perpetual work in progress. I'm constantly adding new plugins and features. Feel free to explore, clone, fork, or even contribute! Pull requests for fixes or new features are always welcome.

👇 **Clone Me:**
```bash
git clone https://github.com/jmsrsd/nvim.git
```

🛠 **Get Started:**
To use this config, copy `init.lua` and the `lua` directory to your Neovim config folder (usually `~/.config/nvim`).

⚠️ **Note:**
This setup is tailored to my preferences, so it might need some tweaking for your taste. Consider it a launchpad for your Neovim journey! 🚀
