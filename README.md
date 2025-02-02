# binforge
BinForge is a compact tool for assembling, linking, and executing x86_64 assembly programs. Ideal for hackers, reverse engineers, and developers, it streamlines converting raw assembly into executables. Whether testing exploits, debugging shellcode, or crafting binaries, BinForge makes the process quick and efficient. 🚀


# Usage:

```bash
binforge.sh myfile.s
```
![Screenshot 2025-02-02 184411](https://github.com/user-attachments/assets/6aaa072c-8b7d-4828-bf72-8f41b1a91ce1)

for debugging:

```bash
binforge myfile.s -g
```

![image](https://github.com/user-attachments/assets/f21b190b-7906-4112-a70a-a3c43df63ef3)


# Move binforge to bin

```bash
mv /path/to/binforge.sh ~/bin/
```

After that, add it to your PATH like this in your .zshrc or .bashrc

```bash
export PATH=$PATH:$HOME/bin
```

```bash
source ~/.zshrc
```
