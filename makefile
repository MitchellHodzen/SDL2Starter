CC = g++
CLIBS = -lSDL2_image -lmingw32 -lSDL2main -lSDL2
INCLUDES = -Iinclude -IC:/CppLibraries/include/SDL2
LIBPATH = -LC:/CppLibraries/lib
OUTPUT = test
DEBUGOUTPUTDIR = bin/debug
RELEASEOUTPUTDIR = bin/release
OBJDIR = bin
SRCDIR = src
CPPVERSION = c++1z

SOURCES = $(wildcard $(SRCDIR)/*.cpp)
POBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=%.o)
OBJECTS = $(addprefix $(OBJDIR)/, $(POBJECTS))

$(OUTPUT): $(OBJECTS)
	$(CC) $(OBJECTS) $(INCLUDES) $(LIBPATH) $(CLIBS) -g -std=$(CPPVERSION) -o $(DEBUGOUTPUTDIR)/$(OUTPUT) $(INCLUDES)
	@echo "\n"Debug build completed\; Enter $(DEBUGOUTPUTDIR)/$(OUTPUT) to run."\n"

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) $(INCLUDES) $(LIBPATH) -c $< -o $@ $(CLIBS) $(INCLUDES)

clean:
	rm $(OBJDIR)/*.o $(DEBUGOUTPUTDIR)/$(OUTPUT) #$(RELEASEOUTPUTDIR)/$(OUTPUT)

#release: $(OBJECTS)
#	$(CC) $(OBJECTS) $(CLIBS) -O3 -o $(RELEASEOUTPUTDIR)/$(OUTPUT)
#	@echo "\n"Release build completed\; Enter $(RELEASEOUTPUTDIR)/$(OUTPUT) to run."\n"