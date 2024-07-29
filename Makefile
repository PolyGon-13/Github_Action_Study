# CC : C컴파일러를 설정(gcc)
# CFLAGS : 컴파일러 플래그 지정 (-Wall 은 모든 경고 메시지를 출력, -Wextra 는 추가적인 경고 메시지를 출력)
CC = gcc
CFLAGS = -Wall -Wextra

# SRCS : 현재 디렉터리의 모든 .c 파일 나열
# OBJS : SRCS 변수에 있는 모든 .c 파일의 확장자를 .o로 변경하여 목적 파일 목록을 제작
# EXEC : 실행 파일의 이름 지정
SRCS = $(wildcard src/*.c)
OBJS = $(SRCS:src/%.c=.o)
EXEC = compile_test

# all : 기본 타켓 설정 (make 명령어를 실행하면 이 타켓이 호출됨 -> 여기서는 EXEC(compile_test)를 빌드)
all: $(EXEC)

# EXEC를 생성하는 규칙 (OBJS는 EXEC를 빌드하는데 필요한 목적 파일들)
# CC를 이용하여 실행 파일 생성 ($@는 현재 타켓(compile_text, $^는 모든 종속 파일->여기서는 목적 파일들)
$(EXEC): $(OBJS)
	$(CC) -o $@ $^

# .c 파일을 .o 파일로 컴파일하는 규칙
# $<는 첫 번째 종속 파일(여기서는 .c 파일)을, $@는 현재 타켓(여기서는 .o 파일)
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# clean : 불필요한 파일을 제거하는 규칙
# make clean 명령어를 실행하는 EXEC와 OBJS 파일을 삭제
clean:
	rm -f $(EXEC) $(OBJS)
	rm -rf obj
