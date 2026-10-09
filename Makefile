.RECIPEPREFIX = >

CC      = gcc
CFLAGS  = -Wall -Wextra -std=c11 -g -Iinclude -MMD -MP
LDFLAGS = -lm
TARGET  = winarr

SRC = $(shell find src -name '*.c')
OBJ = $(SRC:src/%.c=build/%.o)
DEP = $(OBJ:.o=.d)

# Pour les tests : tous les objets sauf main.o
LIB_OBJ  = $(filter-out build/main.o,$(OBJ))
TEST_SRC = $(wildcard tests/test_*.c)
TEST_BIN = $(TEST_SRC:tests/%.c=build/tests/%)

all: $(TARGET)

$(TARGET): $(OBJ)
> $(CC) $(OBJ) -o $@ $(LDFLAGS)

build/%.o: src/%.c
> @mkdir -p $(dir $@)
> $(CC) $(CFLAGS) -c $< -o $@

build/tests/%: tests/%.c $(LIB_OBJ)
> @mkdir -p $(dir $@)
> $(CC) $(CFLAGS) $< $(LIB_OBJ) -o $@ $(LDFLAGS)

test: $(TEST_BIN)
> @for t in $(TEST_BIN); do echo "== $$t"; ./$$t || exit 1; done

clean:
> rm -rf build $(TARGET)

-include $(DEP)

.PHONY: all test clean
