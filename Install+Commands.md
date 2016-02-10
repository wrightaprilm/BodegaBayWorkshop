##Installation instructions

Instance: We need a m3.2xlarge

Because there is plotting, please use -X when ssh. For example:

```UNIX
ssh -X -i 'my.key' ubuntu@server
```

Python:

```UNIX
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-2.5.0-Linux-x86_64.sh 
bash Anaconda2-2.5.0-Linux-x86_64.sh 
sudo apt-get install python-pip 
```
Say yes to everything it asks.

Specific Python packages:

```UNIX
source .bashrc 
conda install pandas 
pip install --user -U dendropy  
sudo apt-get install python-qt4 
```

And some utilities that don't come with hi-mem instances:

```UNIX
sudo apt-get install git g++ make liblapack-dev
```

Phylogeny-building stuff:

```UNIX
git clone https://github.com/stamatak/standard-RAxML.git  
cd standard-RAxML/  
make -f Makefile.PTHREADS.gcc  
rm *.o  
export PATH=$PATH:$HOME/standard-RAxML/  
cd ..  
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/garli/garli-2.01.tar.gz  
tar xvf garli-2.01.tar.gz  
cd garli-2.01/  
./build_garli.sh  
export PATH=$PATH:$HOME/garli-2.01/  
mv bin/Garli-2.01 .  
cd ..  
wget http://people.sc.fsu.edu/~dswofford/paup_test/paup4a147_ubuntu64.gz  
gunzip paup4a147_ubuntu64.gz  
chmod +x paup4a147_ubuntu64  
```

Phylogeny-viewing stuff: On your personal machine, download [FigTree](http://tree.bio.ed.ac.uk/software/figtree/)


Lastly, tutorial materials:

```UNIX
git clone https://github.com/wrightaprilm/BodegaBayWorkshop.git  
export PATH=$PATH:$HOME/BodegaBayWorkshop  
chmod +x ./BodegaBayWorkshop/*.sh  
chmod +x ./BodegaBayWorkshop/*.py  
```

##Commands

First, open the matrix in a text editor of your choosing. Example:

```UNIX
cd BodegaBayWorkshop
vi output/FinalMatrix332390.nex
```

Next, we're going to think about how complete our data are. First, by looking at the raw number of missing data:

```UNIX
./countPhyloMissingWrapper.sh ./output/*.nex
```

This is a really nice quick and dirty way to look at how much missing data we have. But we might want to know more, such as if there are pairs of species that have no data in common (i.e., the relationship has no basis in the data).

```UNIX
paup4a147_ubuntu64
```

This will open PAUP, an open-source phylogeny program written by David Swofford. Once this has opened, enter:

```UNIX
execute ./output/FinalMatrix323320.nex;
set criterion = distance;
hs;
showdist;
end;
```

Try this on several of the data sets. 

Now we're going to convert our matrices for use with RAxML:

```UNIX
./ConversionCall.sh
```

What this does is converts from the more complex Nexus file to a more lightweight Phylip file. You can have a look at the new file if you want. Example:

```UNIX
vi output/FinalMatrix332390.nex.phy
```
Building a phylogeny:

Choose _one_. The last three will take under a minute. The second will take ~4 minutes. The
first will take ~10 minutes.

```UNIX

raxmlHPC-PTHREADS -m GTRCAT -V  -p 5655 -n sb323320 -T 8 -s ./output/FinalMatrix323320.nex.phy 
raxmlHPC-PTHREADS -m GTRCAT -V  -p 5655 -n sb323340 -T 8 -s ./output/FinalMatrix323340.nex.phy 
raxmlHPC-PTHREADS -m GTRCAT -V  -p 5655 -n sb323360 -T 8 -s ./output/FinalMatrix323360.nex.phy 
raxmlHPC-PTHREADS -m GTRCAT -V  -p 5655 -n sb323380 -T 8 -s ./output/FinalMatrix323380.nex.phy 
raxmlHPC-PTHREADS -m GTRCAT -V -p 5655 -n sb323390 -T 8 -s ./output/FinalMatrix323390.nex.phy 
```


Building a phylogeny, Mark II:

Choose _one_. 

Open ./garli.conf and edit this line:

```UNIX
datafname = ./output/MatrixGoesHere.nex
```

with the nexus file you'd like to run. Then type:

```UNIX
cd BodegaBayWorkshop
Garli-2.01
```

to run.

To add a starting tree, edit this line:

```UNIX
streefname = TREEFILE
```
