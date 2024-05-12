include "./vendor/premake/customization/solutions_items.lua"

workspace "D3D11SandboxBase"
    location ("./")
    architecture "x86_64"
    startproject "D3D11SandboxBase"

    configurations { "Debug", "Release" }

    solutionitems {
        ".gitignore",
        ".clang-format",
    }

    flags {
        "MultiProcessorCompile"
    }

    outputDir = "%{cfg.buildcfg}"

    group "Vendor"
        include "vendor/glfw"
        include "vendor/imgui"

    group ""
        include "Base"