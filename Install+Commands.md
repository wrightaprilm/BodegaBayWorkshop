##Installation instructions

Python:
```UNIX
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-2.5.0-Linux-x86_64.sh
bash Anaconda2-2.5.0-Linux-x86_64.sh
```
Say yes to everything it asks.

Specific Python packages:
```UNIX
conda install pandas
pip install --user -U dendropy
```

Phylogeny-building stuff:
```UNIX
git clone https://github.com/stamatak/standard-RAxML.git
cd standard-RAxML/
make -f Makefile.SSE3.gcc
rm *.o
export PATH=$PATH:$HOME/standard-RAxML/
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/garli/garli-2.01.tar.gz
tar xvf garli-2.01.tar.gz
cd garli-2.01/
./build_garli.sh
export PATH=$PATH:$HOME/garli-2.01/
mv bin/Garli-2.01 
cd ..
wget http://people.sc.fsu.edu/~dswofford/paup_test/paup4a147_ubuntu64.gz
gunzip paup4a147_ubuntu64.gz
chmod +x paup4a147_ubuntu64
```

Lastly, tutorial materials:
```UNIX
git clone https://github.com/wrightaprilm/BodegaBayWorkshop.git
export PATH=$PATH:$HOME/BodegaBayWorkshop
chmod +x BodegaBayWorkshop/*.sh
chmod +x BodegaBayWorkshop/*.py
```



