include "msdfgen"

project "msdf-atlas-gen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("obj/" .. outputdir .. "/%{prj.name}")

    files
    {
        "msdf-atlas-gen/**.h",
        "msdf-atlas-gen/**.hpp",
        "msdf-atlas-gen/**.cpp"
    }

    includedirs
    {
        "msdf-atlas-gen",
        "msdfgen",
        "msdfgen/include",
        "." -- This allows <msdfgen/header.h>
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS",
        "MSDF_ATLAS_NO_ARTERY_FONT"
    }

    links
    {
        "msdfgen"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
        symbols "off"
        if vsprops then
            vsprops { ["VcpkgConfiguration"] = "Release" }
        end
