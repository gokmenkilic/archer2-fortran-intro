## History

1950s - Birth of Fortran: Before Fortran, programming involved tedious manual coding in assembly or machine language, requiring deep knowledge of a computer’s architecture. 
Fortran was a game-changer, introducing features like loops, conditionals, and subroutines in a high-level form. The first version, FORTRAN I (1957), was implemented for the IBM 704 computer.

Evolution: \
*FORTRAN II (1958)*: Added subroutines and functions, enhancing modularity. \
*FORTRAN IV (1960s)*: Improved portability across machines. \
*Fortran 77 (1977)*: Standardized and widely adopted, introducing structured programming features. \
*Modern Fortran (Fortran 90, 95, 2003, 2008, 2018)*: Added object-oriented programming, parallel computing support (e.g., coarrays), and dynamic memory allocation, keeping it relevant for HPC.

## Coarrays 

Coarrays are a feature introduced in Fortran 2008 (with roots in Fortran 95 proposals) to support parallel programming directly within the language. They extend the concept of arrays by adding a parallel dimension, allowing data to be distributed across multiple processing units (called "images" in Fortran terminology) in a single program, multiple data (SPMD) model. Coarrays enable developers to write parallel code naturally within Fortran, leveraging its strengths in numerical computation.

A coarray is essentially an array that can be accessed and manipulated across different images (processes or threads) running concurrently. Each image has its own local copy of the coarray, and the programmer can explicitly move data between images or synchronize their execution.


## Differences Between Coarrays and Regular Arrays

Distribution:

Regular Arrays: Exist within a single process or memory space; all elements are local.
Coarrays: Distributed across multiple images, with each image having its own local portion of the coarray. The coarray syntax allows direct access to remote data.

Parallelism:

Regular Arrays: No inherent parallelism; parallel operations require external libraries (e.g., OpenMP) or manual threading.
Coarrays: Built-in parallelism; each image operates independently, and data sharing is explicit via coarray syntax.

Memory Model:

Regular Arrays: Single, contiguous memory allocation in one process.
Coarrays: Partitioned global address space (PGAS) model—each image has its own memory, but coarrays provide a unified way to reference data across images.

## Differences from Other Parallel Programming Concepts

Coarrays vs. MPI (Message Passing Interface):

MPI: A library-based approach where processes communicate explicitly via message passing (e.g., MPI_Send, MPI_Recv). It’s more verbose and requires manual management of communication.
Coarrays: Integrated into Fortran syntax, offering a higher-level abstraction. Data movement is implicit in the coarray notation (e.g., x[2] = y[1]), reducing code complexity.
Trade-off: MPI is more flexible and portable across languages, while coarrays are Fortran-specific and simpler for array-based parallelism.

Coarrays vs. OpenMP:

OpenMP: A directive-based approach for shared-memory parallelism (e.g., #pragma omp parallel). It’s easier for threading within a single node but doesn’t naturally scale to distributed memory (e.g., across HPC nodes).
Coarrays: Designed for distributed-memory parallelism, making them ideal for large-scale HPC systems like Cray machines. They can complement OpenMP for hybrid parallelism (coarrays across nodes, OpenMP within nodes).
Trade-off: OpenMP is simpler for shared-memory systems; coarrays excel in distributed environments.

Coarrays vs. CUDA/Threads:

CUDA/Threads: Low-level, hardware-specific (GPUs) or OS-specific (CPU threads) approaches requiring fine-grained control over parallelism.
Coarrays: High-level, language-native, and hardware-agnostic, abstracting away much of the complexity of thread or GPU management.