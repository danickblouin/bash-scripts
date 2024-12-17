# bash-script

Repo to stock all my bash scripts that I make as I learn how properly to use bash scripts.

### Installation

To make the scripts executable run this command: `chmod a+x <filename>`.

To make it executable from anywhere run this command (on Apple Silicon): 

`sudo ln -s <path_to_original> </usr/local/bin/name_of_the_script>`.

You can also run the `install.sh` script to install all the scripts automatically in the repo.

---

### youtubeUrlTitleParse

Script to output a list of youtube videos with their titles from a txt file full of YouTube links.

---

### removeChar

Removes character passed in parameter for all file titles in the current directory.

---

### pfind

Search for words in a PDF with `pdfgrep` by indicating the number of words that can separate the two words.

Usage: `pfind <separator_count> <words>`

---

### hs

Script to connect my different Bluetooth headphones from the terminal with `blueutil`.

Usage: `hs -<c|d><s|n>`

---

### clrmd

Script to **remove all metadata** (internal and macOS extended attributes) from files.  
Works with multiple files and supports wildcards like `*.pdf` or `*.jpg`.

**Usage**:

```bash
clrmd file1 file2 ...
clrmd *.pdf *.jpg
```
