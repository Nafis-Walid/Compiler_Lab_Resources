Initially you will have only a .c file(here it is hello.c). Now from command line you have to run these command and the
corresponding file will be created

___________________________________________________________________________________________________________________________
Command:        gcc -o hello hello.c 
Explanation:    This command will compile the hello.c file and will make an executable file called hello.exe
___________________________________________________________________________________________________________________________
Command:        gcc -E hello.c > hello.i
Explanation:    It will preprocess the "hello.c" file and the preprocessed output will be stored in a file called "hello.i"
                Recall: we used '>' this operator in Operating System Sessional Course
___________________________________________________________________________________________________________________________
Command:        gcc -S -masm=intel hello.i
Explanation:    -S means stop. after compilation phase now it will not go to linking phase, instead it will generate an 
                assembly file named "hello.s" in intel-style syntax. This "hello.s" file contains low level representation 
                of the main program.  
___________________________________________________________________________________________________________________________
Command:        as -o hello.o hello.s
Explanation:    it will invoke GNU Assembler and convert the "hello.s" assembly code to a machine code. the machine code 
                will be saved in "hello.o" object file which is not executable yet
___________________________________________________________________________________________________________________________
Command:        objdump -M intel -d hello.o > hello.dump
Explanation:    This command will deassemble the "hello.o" file in intel-syntax and writes the deassembled output to a 
                file named "hello.dump". 
___________________________________________________________________________________________________________________________
In my computer when I tried to execute these command sequentially, "gcc -S -masm=intel hello.i" during this command there
were never ending lines of error message was coming. 

But don't worry, we will not use this command individually. Rather, we will create a file called Makefile(for this you 
have to add the Makefile extension of VSCode). on the Makefile file, we will create a label(in here it is called main), 
and under that label we will write this command sequentially. by using make file, from terminal we can execute these 
commands just by typing 
                                                make <label_name>
                                                Example:
                                                    make main
and after hitting enter all the command line inside the Makefile file will execute sequentially, and the corresponding
operations will be performed.
___________________________________________________________________________________________________________________________