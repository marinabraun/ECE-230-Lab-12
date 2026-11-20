# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Group 9: Marina and Evan
## Summary
In this lab we explored both One Hot and Binary encoding both on paper with K-maps and implemented in verilog.

## Lab Questions

### Compare and contrast One Hot and Binary encodings
One hot and binary encodings have the same result but use different methods to achieve that result. One hot encoding will give each state its own flip flop and as a result makes the output and next state logic simple to find since only one flip flop needs to be checked. Binary encoding will store the state as a binary number. As a result fewer flip flops are used but it requires checking every flip flop to find the output and next state.

### Which method did your team find easier, and why?
Our team found one hot encoding easier because it is simpler to implement and understand. Since each state has its own flip flop writing out the next state is easier directly from the state diagram. Binary encoding takes more work because of the requirement of building a KMap for every bit and handling the unused codes.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
The FPGA has plenty of flip flops available, which makes one hot encoding an ideal choice since its simpler logic is faster and easier to design. Binary encoding becomes more relevant when a state machine has so many states that giving each one its own flip flop would no longer be reasonable. Binary is also the more space efficient option when other parts of the design are already using up the available flip flops.
