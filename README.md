## Jabba's Neovim C/C++ Configuration
#### _Currently used in both MacOS and Windows_

This is my personal Neovim configuration for C/C++. While it works well for me and my workflow, it may not be what you expect or prefer. Please use this configuration with that in mind.

### Preview
![alt text](screenshots/screenshot1.png)

### Language Features

* LSPs: clangd, cmake-language-server and lua-language-server
    * Includes clang-tidy support with clangd
* LSP Completion: hrsh7th/nvim-cmp
* Language Formatting and Diagnostics: nvimtools/none-ls.nvim
    * Formatters include: clang-format, cmake-format and stylua
* Universal Ctags
* Easy Terminal Access: akinsho/toggleterm

_Please Note: clangd is being used for LSP completion, diagnostics and formatting. To achieve this, it requires the presence of either a compile_commands.json file or a compile_flags.txt file in your project. For more information, please refer to the following link: [clangd Getting Started](https://clangd.llvm.org/installation.html#project-setup)._

### Other Features

* Theme: kanagawa [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim.git)

### Dependencies
The following software needs to be installed before applying configuration:

#### _MacOS_
The following Homebrew packages need to be installed:
* clang-format
* cmake
* luarocks
* neovim
* ripgrep
* tree-sitter
* universal-ctags
* font-jetbrains-mono-nerd-font (you can use a different nerd font, if you like)

#### _Windows_
The Windows installation is easy, but requires some not-so-obvious details. Consequently, I am providing direct installation instructions for each of the required software. You can, however, choose to use your preferred package manager such as: Scoop, Winget or Chocolatey.

7-Zip ([https://www.7-zip.org](https://www.7-zip.org))
* Do a standard installation
* After installation, move the Uninstall.exe file from C:\Program Files\7-Zip to another location, such as a newly created subdirectory. This is intended to hide the file from view when you add 7-Zip to the PATH in the next step.
* Add C:\Program Files\7-Zip to your system PATH.

Git ([https://git-scm.com/downloads](https://git-scm.com/downloads))
* Install as per standard instruction

Python (current version ok - minimum version 3.9.13) ([https://www.python.org/downloads/](https://www.python.org/downloads/))
* Do a full installation (including pip, etc.)
* After the installation, run the following from the command line (virtual environment capability is required by Mason to install some of the configuration packages):
   * pip install virtualenv
   * pip install virtualenvwrapper-win

CMake ([https://cmake.org/download](https://cmake.org/download))
* Install as per standard instruction, but make sure to add to system PATH

Lua ([https://luabinaries.sourceforge.net/download.html](https://luabinaries.sourceforge.net/download.html))
* Download lua-X.X.X_Win64_bin.zip
* Extract the contents to C:\ProgramsOther\Lua (or any other location you prefer)
* Change the name of luaXX.exe to lua.exe (I am not sure if this is necessary)
* Add C:\ProgramsOther\Lua to your system PATH

LuaRocks ([https://luarocks.github.io/luarocks/releases](https://luarocks.github.io/luarocks/releases))
* Download the stand-alone Windows 64-bit binary version zip file
* Extract the contents to C:\ProgramsOther\LuaRocks (or any other location you prefer)
* Add C:\ProgramsOther\LuaRocks to your system PATH

Universal Ctags ([https://github.com/universal-ctags/ctags-win32/releases](https://github.com/universal-ctags/ctags-win32/releases))
* Download ctags-vX.X.X-x64.zip
* Extract the contents to C:\ProgramsOther\UniversalCtags (or any other location you prefer)
* Add C:\ProgramsOther\UniversalCtags to your system PATH

RipGrep ([https://github.com/BurntSushi/ripgrep/releases](https://github.com/BurntSushi/ripgrep/releases)
* Download ripgrep-X.X.X-i686-pc-windows-msvc.zip
* Extract the contents to C:\ProgramsOther\RipGrep (or any other location you prefer)
* Add C:\ProgramsOther\RipGrep to your system PATH

Nerd Font ([https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads))
* Download JetBrainsMono.zip (or whichever nerd font you prefer)
* Extract the contents to a temporary directory
* Select all of the .ttf files, right click, then select Install

LLVM ([https://github.com/llvm/llvm-project/releases](https://github.com/llvm/llvm-project/releases))
* Download LLVM-X.X.X-win64.exe and install as per standard instruction
   * Make sure to select "Add LLVM to the system PATH for all users" during installation
* This installation includes clang, clangd, clang-format, clang-tidy, etc.
* This installation is intended to be used by the Neovim configuration for completion, diagnostics and formatting. It is not intended to replace, or otherwise conflict with, your Microsoft Visual Studio build system.

Neovim ([https://github.com/neovim/neovim/releases](https://github.com/neovim/neovim/releases))
* Download and install nvim-win64.msi (I am using the stable version 0.9.5 on Windows)
