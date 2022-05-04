## go-sponge
This is a golang alternative to the already existing sponge [Sponge](https://linux.die.net/man/1/sponge) utility  

### Motivation
Recently I faced a problem where I wanted a tool to output to a file using regular bash commands but for some reason, it didn't work, I didn't understand why at first but after a quick search it seemed that it was related to the fact that the command I was using was behaving differently with stdout.  
Sponge is here to solve this kind of problem, but sponge is only available on the Linux distribution repositories, I wanted to be able to download a static binary from elsewhere, and automate it on a ci pipeline... finito.
That's the reason this alternative was born, it won't be faster for sure but it's simpler to deploy for sure.   
And... Why not!?  

### Benchmarks
Reading a file with 7148336 characters on a Intel(R) Core(TM) i7-8705G CPU @ 3.10GHz with 32 GB RAM

```
user@pc:/home/user$ time cat file.xml | sponge out.txt

real    0m0,044s
user    0m0,000s
sys     0m0,057s
```

```
user@pc:/home/user$ time cat file.xml | go-sponge out.txt

real    0m0,159s
user    0m0,161s
sys     0m0,070s
```
