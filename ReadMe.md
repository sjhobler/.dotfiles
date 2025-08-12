## Philosophy of working environment

**Note:** This setup reflects my personal preferences and workflow philosophy. It is obviously opinionated.

### Core Principles
My working environment is built on two fundamental objectives:
1. Maximize efficiency -- minimize friction between thought and action
2. Sustain deep focus -- keep concentration high for prolonged periods

Specifically, my design decisions are centered around eliminating search fatigue -- the cognitive overhead of hunting for buttons, navigating menus, or browsing file trees. I found a keyboard-driven terminal workflow to work best.

### Key components

#### Neovim
Neovim is minimal, efficient and highly customizable with a large open source community that supports it. The pros and cons are debated. But I would argue that the VIM keybindings enable an objectively better text manipulation experience. There is a common notion that they are hard to learn. While it takes some time investment, the key is not to get overwhelmed with the many features and focus on the core set of keybindings. That way, it is easy to be productive after one weekend. 

There is a ubiquity bonus to learning VIM bindings. Most software comes with some version of VIM bindings (even on Overleaf supports them now). As more work is shifted to the cloud -- e.g. for big data and other High Performance Computing -- being fluent in terminal-based editing becomes increasingly valuable. When you SSH into a server or a remote desktop, Vim is almost always there.


#### Tmux
A terminal multiplexer. Allows you to simultaneously manage different work sessions, panes and windows. My workflow revolves around
- Sessions: Each project lives in its own persistent sessions
- Windows: Different aspects of a project (e.g. coding, data analysis, and writing) get separate windows
- Persistence: Sessions continue running in the background when I context-switch between projects

This setup allows me to maintain multiple work contexts without losing state, making it easy to jump between projects while preserving exactly where I left off.
