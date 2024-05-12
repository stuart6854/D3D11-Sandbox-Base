project "Base"
    kind "StaticLib"
    language "C++"
    architecture "x86_64"
    location ("./")

    targetdir   ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
    objdir      ("%{wks.location}/bin/obj/" .. outputDir .. "/%{prj.name}")

    -- Working directory for the debugger
    debugdir ("./")

    includedirs { 
        "src/",
        "../vendor/glfw/include/",
        "../vendor/stb/include/",
        "../vendor/glm/include/",
        "../vendor/imgui/",
    }

    files { 
        "src/**.h",
        "src/**.hpp",
        "src/**.cpp",
    }

    links {
        "glfw",
        "imgui",
    }

    filter "system:windows"
        cppdialect "C++20"
        systemversion "latest"
        -- Set runtime library to multithreaded
        staticruntime "off"

        defines {
            "WIN32_LEAN_AND_MEAN",
            "NOMINMAX"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
