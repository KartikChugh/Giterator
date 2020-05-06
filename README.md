# giterator: automated repo assembly
![giterator logo](https://raw.githubusercontent.com/KartikChugh/giterator/master/logo.jpg)

## Assemble repositories from the command line
Giterator is a utility designed to duplicate the content of existing files incrementally, leaving a chain of evenly spaced commits over time. Just give it files to recreate, a destination folder, and a time horizon, and then let it run in the background!

## Usage
Clone this repository to your computer, or install the `giterate` script manually. 
Usage is as follows:
```bash
./giterate.sh <source> <destination> <time>
```
An example is provided below:
```bash
./giterate.sh "C:/Users/User/regression.ipynb" "C:/Users/User/StatisticsRepo/" 6
```

This would create a new `regression.ipynb` file under the `/StatisticsRepo/` directory in a span of six hours, with regular commits in between.
