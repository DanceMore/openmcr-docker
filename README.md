# openmcr-docker

Dockerizing https://github.com/iansan5653/open-mcr to help my dad

---

## usage

```
docker run --rm -it -v "$(pwd)"/input:/input -v "$(pwd)"/output:/output ghcr.io/dancemore/dancemore/openmcr-docker --args --args /input /output
```

> [!IMPORTANT]
> because we are running in a container, we need to get data in and out of the container.
> take note of how these arguments work.

we are using `-v` volume arguments and `$(pwd)` to expand the current directory. for ease of use,
you may want to make a small project directory dedicated to moving data in and out. think of it
like a Network Volume being used to transfer data from your laptop to the server. copy data if
you are worried about in-place operations damaging originals.

as a result of this indirection, your `input_folder output_folder` arguments will always be
`/input /output`




---
### openmcr --help

```
usage: main.py [-h] [--anskeys ANSKEYS] [--formmap FORMMAP] [--variant {75,150}] [-ml] [-e] [-s] [-d] [--mcta] [--disable-timestamps] input_folder output_folder

OpenMCR: An accurate and simple exam bubble sheet reading tool.
Reads sheets from input folder, process and saves result in output folder.

positional arguments:
  input_folder          Path to a folder containing scanned input sheets.
                        Sheets with student ID of "9999999999" treated as keys. Ignores subfolders.
  output_folder         Path to a folder to save result to.

options:
  -h, --help            show this help message and exit
  --anskeys ANSKEYS     Answer Keys CSV file path. If given, will be used over other keys.
  --formmap FORMMAP     Form Arrangement Map CSV file path. If given, only one answer key may be provided.
  --variant {75,150}    Form variant either 75 questions (default) or 150 questions.
  -ml, --multiple       Convert multiple answers in a question to F, instead of [A|B].
  -e, --empty           Save empty answers as G. By default, they will be saved as blank values.
  -s, --sort            Sort output by students' name.
  -d, --debug           Turn debug mode on. Additional directory with debug data will be created.
  --mcta                Output additional files for Multiple Choice Test Analysis.
  --disable-timestamps  Disable timestamps in file names. Useful when consistent file names are required. Existing files will be overwritten without warning!

```



## building (obsolete, use GHCR / cicd)

because I'm using relative paths to add the source code to the container build,
it will be easiest to copy the Dockerfile into the `open-mcr` directory and run
from there.

```
cp Dockerfile /path/to/cloned/open-mcr
cd /path/to/cloned/open-mcr
docker build -t myname/openmcr .
```
