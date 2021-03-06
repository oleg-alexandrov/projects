#PBS -S /bin/bash
#PBS -N cfd

# This example uses the Harpertown nodes
# User job can access ~7.6 GB of memory per Harpertown node.
# A memory intensive job that needs more than ~0.9 GB
# per process should use less than 8 cores per node
# to allow more memory per MPI process. This example
# asks for 64 nodes and 4 MPI processes per node.
# This request implies 64x4 = 256 MPI processes for the job.
##PBS -l select=64:ncpus=8:mpiprocs=4:model=har
#PBS -l select=1:ncpus=8
#PBS -l walltime=96:00:00
#PBS -j oe
#PBS -W group_list=s1219 
#PBS -m e

type=bayes
p=100
n=$type"_p"$p
outFile=output3_job_$n.txt
echo Job is $n >2 # let it go to stderr so that we can see it in the job report file
echo Job is $n    
echo output goes to $outFile

if [ "$PBS_O_WORKDIR" != "" ]; then cd $PBS_O_WORKDIR; fi
./run3.sh $type $p > $outFile 2>&1

