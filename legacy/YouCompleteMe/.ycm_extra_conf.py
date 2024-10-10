import os
import ycm_core

FLAGS = [
    "-x", 
    "c++", 
    "-std=c++2a",
    "-I", 
    "/usr/local/include/opencv4",
]

SOURCE_EXTENSIONS = [".cpp", ".cxx", ".cc"]

def Settings(filename, **kwargs):
    return {
        "flags": FLAGS,
    }

