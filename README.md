# giterator: automated repo reassembly
![giterator logo](https://raw.githubusercontent.com/KartikChugh/giterator/master/img/logo.jpg)

## Reassemble repositories from the command line
Giterator is a utility designed to clone the content of existing files incrementally, leaving a chain of commits spaced out over time. Just give it files to recreate, a destination folder, and a time horizon, and then let it work in the background!

The program works by dividing source files into discrete "chunks" that are to be written to disk periodically. The chunks are cached, so the source file can be deleted upon execution if desired.

## Usage is simple
Clone this repository to your computer, or download the `giterate` script directly. 
Usage is as follows:
```bash
./giterate.sh <source> <destination> <time>
```
An example is provided below:
```bash
./giterate.sh "C:/Users/User/notebook.ipynb" "C:/Users/User/StatisticsRepo/" 5
```

This would create a new `notebook.ipynb` file under the `/StatisticsRepo/` directory in a span of five hours, with regular<sup>†</sup> commits in between. To work on multiple files at once, run the script concurrently in another shell.

![giterator logo](https://raw.githubusercontent.com/KartikChugh/giterator/master/img/example.PNG)

## Fine-tune the process
With recent updates, giterator now allows you to specify the number of chunks, or commits, that should be used when working on your files. Include the commit count when calling the script.

```bash
./giterate.sh "C:/Users/User/notebook.ipynb" "C:/Users/User/StatisticsRepo/" 5 8 
```

writes eight commits in five hours, or roughly one commit (with 1/8 of the work done) every 40 minutes. Use the time and chunk settings to tailor the workflow to your liking (default chunk count is 5).

### <sup>†</sup>Variation


## Dependencies
Just `git` and a Bash shell.

## To-Do
### Bugfixes
- ~~Fix newline behavior~~ [(#1](https://github.com/KartikChugh/giterator/issues/1), [#7](https://github.com/KartikChugh/giterator/issues/7))
- ~~Fix working directory~~ [(#2](https://github.com/KartikChugh/giterator/issues/2), [#5](https://github.com/KartikChugh/giterator/issues/5))
- ~~Restore whitespace writing~~ [(#4)](https://github.com/KartikChugh/giterator/issues/4)
- ~~Ensure full file writing~~ [(#6)](https://github.com/KartikChugh/giterator/issues/6)

### Features
- ~~Parameterize number of commits~~
- Automate pushing to upstream
- Select entire source folders
- ~~Lessen commit time regularity~~
- ~~Create destination folder~~
