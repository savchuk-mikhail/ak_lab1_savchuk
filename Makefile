CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17

TARGET = calculator_app
LIB = libcalculator.a

all: $(TARGET)

calculator.o: calculator.cpp calculator.h
	$(CXX) $(CXXFLAGS) -c calculator.cpp

main.o: main.cpp calculator.h
	$(CXX) $(CXXFLAGS) -c main.cpp

$(LIB): calculator.o
	ar rcs $(LIB) calculator.o

$(TARGET): main.o $(LIB)
	$(CXX) $(CXXFLAGS) main.o -L. -lcalculator -o $(TARGET)

clean:
	rm -f *.o $(LIB) $(TARGET)
