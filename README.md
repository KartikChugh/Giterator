# giterator: automated repo reassembly
![giterator logo](https://raw.githubusercontent.com/KartikChugh/giterator/master/logo.jpg)

## Reassemble repositories from the command line
Giterator is a utility designed to duplicate the content of existing files incrementally, leaving a chain of commits spaced out over time. Just give it files to recreate, a destination folder, and a time horizon, and then let it run in the background!

The program works by dividing source files into discrete "chunks" that are to be written to disk periodically. The chunks are cached, so the source file can be deleted upon execution of giterator.

## Usage is simple
Clone this repository to your computer, or download the `giterate` script directly. 
Usage is as follows:
```bash
./giterate.sh <source> <destination> <time>
```
An example is provided below:
```bash
./giterate.sh "C:/Users/User/regression.ipynb" "C:/Users/User/StatisticsRepo/" 6
```

This would create a new `regression.ipynb` file under the `/StatisticsRepo/` directory in a span of six hours, with regular commits in between. To work on multiple files at once, run the script concurrently in another shell.

## Dependencies
Just `git` and a Bash shell.

## To-Do
### Bugfixes
- ~~Fix inconsistent newline behavior [(#1)](https://github.com/KartikChugh/giterator/issues/1)~~
- Fix working directory switch [(#2)](https://github.com/KartikChugh/giterator/issues/2)
### Features
- ~~Parameterize number of commits~~
- Automate pushing to upstream
- Select entire source folders
- Lessen commit time regularity
- ~~- Create destination folder~~
