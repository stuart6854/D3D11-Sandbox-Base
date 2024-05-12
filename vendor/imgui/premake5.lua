project "imgui"
    kind "StaticLib"
    language "C"
    architecture "x86_64"
    location ("./")

    targetdir   ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
    objdir      ("%{wks.location}/bin/obj/" .. outputDir .. "/%{prj.name}")

    -- Working directory for the debugger
    debugdir ("./")

    files { 
        "*.cpp" 
    }

    includedirs { "../glfw/include" }

    links { "glfw" }

    filter "system:windows"
        cppdialect "C++20"
        systemversion "latest"
        -- Set runtime library to multithreaded
        staticruntime "on"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"