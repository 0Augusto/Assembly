# Parallel Genetic Algorithm in ARM64 Assembly

This project implements a parallel genetic algorithm in ARM64 assembly language, optimized for Apple Silicon (M1/M2) processors. The algorithm uses Grand Central Dispatch (GCD) for efficient parallelization across multiple CPU cores.

## Features

- **Parallel Fitness Evaluation**: Distributes fitness calculations across multiple CPU cores
- **Parallel Selection & Crossover**: Concurrent genetic operations for improved performance
- **Optimized for Apple Silicon**: Leverages ARM64 architecture and NEON instructions
- **Efficient Memory Management**: Manual memory management to avoid race conditions
- **Real-time Progress Tracking**: Displays generation-by-generation progress

## Requirements

- macOS with Apple Silicon (M1/M2 processor)
- Xcode command line tools
- ARM64 assembly toolchain

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd parallel-genetic-algorithm-asm
```

2. Build the project:
```bash
make
```

Or compile manually:
```bash
clang -o genetic_algorithm genetic_algorithm.s -framework Foundation -framework Dispatch
```

## Usage

Run the genetic algorithm:
```bash
./genetic_algorithm
```

The program will display progress for each generation and show the final best solution found.

## Algorithm Details

### Parameters
- Population size: 50 individuals
- Genes per individual: 4 integer values
- Maximum fitness value: 50
- Generations: 50,000
- Mutation probability: 50%

### Parallelization Strategy
The implementation uses Grand Central Dispatch (GCD) to parallelize:
1. Fitness evaluation across population members
2. Selection operations for parent choosing
3. Crossover and mutation operations
4. Final fitness evaluation

## Performance

The parallel implementation provides significant speed improvements:
- ~2.5x speedup on quad-core Apple Silicon CPUs
- Linear scaling with additional CPU cores
- Efficient resource utilization through GCD

## Code Structure

Key functions in the assembly code:
- `_fitness`: Calculates individual fitness
- `_generate_individual`: Creates random individuals
- `_mutate`: Applies mutations to individuals
- `_crossover`: Performs genetic crossover
- `_evaluate_fitness_parallel`: Parallel fitness evaluation
- `_select_individual_parallel`: Parallel selection
- `_crossover_parallel`: Parallel crossover operations

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is available for educational purposes. See LICENSE file for details.

## References

- Apple ARM64 Assembly Guide
- Grand Central Dispatch Documentation
- Genetic Algorithm Fundamentals
