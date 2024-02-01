# Docker-Musly

![Conky logo](favicon.png)

I couldn't find any information about the tool's build environment, so I decided to rebuild one with the help of docker. I'm making this information available in this repository in case it's useful to someone else.

/!\ DISCLAIMER /!\ this docker container is based on the obsolete gcc image gcc:6.4 [Available here](https://hub.docker.com/layers/library/gcc/6.4/images/sha256-43acacbef46af54806d333454ce9e947a7fac57ab191441c4b7bf0fa2f2ef206?context=explore) which provide an old Debian OS. Don't expose this docker container outside of your very local network !! /!\ DISCLAIMER /!\

## Features

Musly is a fast and high-quality audio music similarity library written in C/C++. Musly analyzes the the audio signal of music pieces to estimate their similarity. No meta-data about the music piece is included in the similarity estimation.
The command line application included in the package permit to generate some automatic music playlists right away.

## Installation

For those who want to try this docker's container, here’s a step by step how to setup guide:

As a first step, clone this repository:

``` bash
git clone ... docker-musly
```

Then browse into the new created folder and create the container using the supplied dockerfile
``` bash
cd docker-musly && docker build -t musly .
```

once the container has been created, you can launch it using the little bash script provided :
```
bash docker-start.sh
```

You should end up in the docker container shell, where the musly tool has been compiled.

## Usage

``` bash
root@be7e7136c000:/musly/build/musly# ./musly -h
Music Similarity Library (Musly) - http://www.musly.org
Version: 0.2
(c) 2013-2014, Dominik Schnitzer <dominik@schnitzer.at>
    2014-2016, Jan Schlüter <jan.schlueter@ofai.at>

Options for ./musly
  -h           this help screen.
  -v 0-5       set the libmusly debug level: (0: none, 5: trace).
               DEFAULT: 0
  -i           information about the music similarity library
  -c COLL      set the file to write the music similarity features to
               and to use for computing similarities.
               DEFAULT: collection.musly
  -j JBOX | -J set the file to write the jukebox state to, to speed up
               repeated calls of '-p', '-e', '-E', '-m', or '-s'.
               Use -J to set it to COLL.jbox.
               DEFAULT: Do not store the jukebox state on disk.
  -k NUM       set number of similar songs per item when computing
               playlists ('-p'), sparse distance matrices ('-s')
               or when evaluating the collection ('-e').
               DEFAULT: 5
 INITIALIZATION:
  -n MTH | -N  initialize the collection (set with '-c') using the
               music similarity method MTH. Available methods:
               mandelellis,timbre
               '-N' automatically selects the best method.
 MUSIC ANALYSIS/PLAYLIST GENERATION:
  -a DIR/FILE  analyze and add the given audio FILE to the collection
               file. If a Directory is given, the directory is scanned
               recursively for audio files.
  -x EXT       only analyze files with file extension EXT when adding
               audio files with '-a'. DEFAULT: '' (any)
  -p FILE      print a playlist of the '-k' most similar tracks for
               the given FILE. If FILE is not found in the collection
               file, it is analyzed and then compared to all other
               tracks found in the collection file ('-c').
 LISTING:
  -l           list all files in the collection file.
  -d           dump the features in the collection file to the console
 EVALUATION:
  -e NUM | -E  perform a basic kNN (k-nearest neighbor) music genre
               classification experiment using the selected collection
               file. The parameter k is set with option '-k'. The
               genre is inferred from the path element at position NUM.
               The genre position within the path is guessed with '-E'.
  -f NUM       Use an artist filter for the evaluation ('-e'). The 
               artist name is inferred from the path element at
               position NUM.
               DEFAULT: -1 (No artist filter)
  -m FILE      compute the full similarity matrix for the specified
               collection and write it to FILE. It is written in MIREX
               text format (see http://www.music-ir.org/mirex under
               Audio Music Similarity and Retrieval, Distance matrix
               output files).
  -s FILE      compute a sparse similarity matrix giving the k nearest
               neighbors for each item of the specified collection and
               write it to FILE. It is written in MIREX text format.

root@be7e7136c000:/musly/build/musly# 
```

## Full detail

You can follow the instruction here now [](https://www.musly.org/about.html).

Initialize a new Musly collection
``` bash
root@be7e7136c000:/musly/build/musly# ./musly -N
```

Analyze all MP3 files in the given path (by default the docker-start script mount the '/opt/musly/musics/' directory as a volume inside of musly's container)
``` bash
root@be7e7136c000:/musly/build/musly# musly -x mp3 -a /opt/musly/musics/
```

Compute a playlist
```bash
root@be7e7136c000:/musly/build/musly# musly -p metal.00047.au
Computing the k=5 most similar tracks to: metal.00047.au
  metal.00053.au
  metal.00054.au
  metal.00056.au
  metal.00050.au
  metal.00049.au
```

## Credits
Many thanks to :

- [Dominik Schnitzer](https://github.com/dominikschnitzer/musly/releases)

## License
MIT © [Kosteron]()