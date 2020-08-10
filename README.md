# blinder

A Ruby script to randomize filenames.

## Installation

1. Download blinder.command
2. Make blinder.command executable by running the following command in Terminal

   ```
   chmod +x blinder.command
   ```

## Usage

1. Have folder with all of the files you want randomized/blinded (and only those files)
2. Copy/paste `blinder.command` into that folder
3. Double click on `blinder.command`
4. blinder will do its thing, and generate a 'mapping.csv' file
5. Open the `mapping.csv` file, and save a copy of the file as whatever you want it titled/as an excel file, and can do your stuff with the key column hidden

If you want to revert the file names to their previous names after you've done all of the scoring, double click `blinder.command` again, and if there's already a `mapping.csv` file, it will revert the file names back to their original names and delete the `mapping.csv` file.
