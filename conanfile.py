from conans import ConanFile, CMake, tools


class CmakeFindFmt(ConanFile):
    name = "cmake_findfmt"
    version = "1.0"
    license = "MIT"
    author = "Ede Bittner bittner.ede@gmail.com"
    url = "https://github.com/elnoir/conan-cmake_findfmt"
    description = "Find fmt lib"
    topics = ("cmake", "conan", "fmt")
    settings = None
    exports_sources = "Findfmt.cmake"
    exports = "LICENSE.md"

    def package(self):
        self.copy("Findfmt.cmake", keep_path=False)
