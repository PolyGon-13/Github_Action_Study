CC = gcc
CFLAGS = -Wall -Wextra

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
EXEC = my_program

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CC) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(EXEC) $(OBJS)
